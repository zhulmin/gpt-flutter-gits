import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart' as DioPackage;
import 'package:dio/dio.dart';

import '../storage/storage.dart';
import '../utils/Aes256.dart';

class StreamService {
 
  static var client = Dio();

  //每次开始游戏, 生成一个新的的gameId.
  static Future<Stream<String>?> ask(String content,{String? gameId}) async {
    String token = StorageY.getToken() ?? "";
    token =
        "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzNGc3NXdlNy0yZnMwLTRmZm8tYTVkYS1zZGZhc2VmZWUiLCJhdXRoIjpbeyJhdXRob3JpdHkiOiJST0xFX0NMSUVOVCJ9XSwiaWF0IjoxNjg0ODA3ODI0LCJleHAiOjE2ODYwMTc0MjR9.v2ID8FVESxRWZWUXRkm_y8dEgotQQBa0mWh54igeMRE";
    String bearerToken = "Bearer " + token;

    String sign = md5.convert(utf8.encode("Jjie&jfi#j" + content)).toString();
    sign = md5.convert(utf8.encode(token + sign)).toString();

    String data = Aes256.encrypt(content, 'JIh3mf836-s3un@6');

    try {
      DioPackage.Response<ResponseBody> rs = await client.post<ResponseBody>(
        // 'http://192.168.50.2:8086/api/v1/gpt/answer',
        'http://192.168.50.2:8086/emit-test',
        //TODO: 加密相关
        data: gameId == null ? {"content":data} : {"content":data,"gameId":gameId},
        options: Options(headers: {
          "Authorization": bearerToken,
          "Signature": sign,
          "Accept": "text/event-stream",
          "Cache-Control": "no-cache",
        }, responseType: ResponseType.stream), // set responseType to `stream`
      );

      StreamTransformer<Uint8List, List<int>> unit8Transformer =
          StreamTransformer.fromHandlers(
        handleData: (data, sink) {
          sink.add(List<int>.from(data));
        },
      );
      return rs.data?.stream
          .transform(unit8Transformer)
          .transform(const Utf8Decoder())
          .transform(const LineSplitter());
    } catch (e) {
      rethrow;
    }

  }

}
