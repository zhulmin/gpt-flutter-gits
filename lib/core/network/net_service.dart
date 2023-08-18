import 'package:get/get.dart';
import 'package:gpt_flutter/core/ui/toast.dart';
import 'package:logger/logger.dart';
import '../config/env.dart';
import '../storage/storage.dart';
import 'api.dart';
import 'resp_entity.dart';


class _BaseProvider extends GetConnect {
  late final Logger logger;

  _BaseProvider() {
    onInit();
  }

  @override
  void onInit() {
    httpClient.baseUrl = EnvConfig.baseUrl;
    httpClient.timeout = const Duration(seconds: 15);
    httpClient.defaultDecoder = RespEntityDecoder;

    httpClient.addRequestModifier<void>((request) {
      String? token = StorageY.getToken();
      // String? token;
      request.headers['x-access-token'] = token ?? "";
      request.headers['device'] = GetPlatform.isIOS ? 'IOS' : 'ANDROID';
      request.headers['api-version'] = '1.0';
      request.headers['Content-Type'] = 'application/json';
      request.headers['app-name'] = 'Volla';

      return request;
    });

    logger = Logger(
      printer: PrettyPrinter(
          colors: true,
          // Colorful log messages
          printEmojis: true,
          // Print an emoji for each log message
          printTime: false),
    );

    logger.d('初始化_BaseProvider');

    super.onInit();
  }

  RespEntity? RespEntityDecoder(data) {
    //TODO: 非服务器错误需要再这里处理
    if (data is Map<String, dynamic>) {
      return RespEntity.fromJson(data);
    } else {
      logger.e(data);
      ToastY.showError('Error request');
    }
    return null;
  }

  test() {
    String image = 'aa';
    final form = FormData({
      'file': MultipartFile(image, filename: 'avatar.png'),
      'otherFile': MultipartFile(image, filename: 'cover.png'),
    });
    return post('http://youapi/users/upload', form);
  }
}

enum RequestMethod {
  GET('get'),
  POST('post');
  final String value;
  const RequestMethod(this.value);
}

typedef NetServiceDecoder<T> = T Function(Map<String, dynamic> data);

class NetService {
  static final NetService _instance = NetService._internal();

  factory NetService() {
    return _instance;
  }

  NetService._internal();

  final _BaseProvider _baseProvider = _BaseProvider();

  Future<T?> _request<T>(String url, NetServiceDecoder<T> decoder, {RequestMethod method = RequestMethod.POST, Map<String, dynamic>? query, dynamic body, String? endOfPath}) async {
    
    //headers
    Map<String, String> headers = {};

    Response response = await _baseProvider.request(url + (endOfPath ?? ''), method.value, query: query, body: body, headers: headers);

    if (T is RespEntity) {
      return response.body as T?;
    }

    RespEntity? resp = response.body;
    if (resp == null) {
      ToastY.showError(response.statusText ?? 'Unknown Error');
      return null;
    }

    if (resp.code != EnvConfig.okCode) {
      _baseProvider.logger.e(resp.msg);
      ToastY.showError(resp.msg);

      //TODO: token错误重新登录或者重新获取令牌
      // if (resp.code == 8401) {
      //   AppManager.logout();
      // }
      return null;
    }

    if (resp.data is Map<String, dynamic>) {
      Map<String, dynamic> data = resp.data as Map<String, dynamic>;
      var model = decoder(data);
      return model;
    }else {
          ToastY.showError('Response format error');
    }

    return null;
  }

  static Future<T?> get<T>(Api api, NetServiceDecoder<T> decoder, {Map<String, dynamic>? query, String? endOfPath}) async {
    return _instance._request(api.path, decoder, method: RequestMethod.GET, query: query, endOfPath: endOfPath);
  }

  static Future<T?> post<T>(Api api, NetServiceDecoder<T> decoder, {Map<String, dynamic>? query, dynamic body, String? endOfPath}) async {
    return _instance._request(api.path, decoder, method: RequestMethod.POST, query: query, body: body, endOfPath: endOfPath);
  }

}
