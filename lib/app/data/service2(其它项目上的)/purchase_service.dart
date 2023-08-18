import 'package:chat_play/core/network/api.dart';
import 'package:chat_play/core/network/net_service.dart';
import 'package:chat_play/core/network/resp_entity.dart';

class PurchaseService {
  
  static Future<RespEntity?> appleVerity(
      {required String receipt, required String transactionId}) async {
    var body = {"receipt": receipt, "transactionId": transactionId};
    var response =
        await NetService.post(Api.iap, RespEntity.fromJson, body: body);
    return response;
  }
}
