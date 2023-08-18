import 'package:chat_play/app/data/enums/enums.dart';
import 'package:chat_play/app/data/models/feature_entity.dart';
import 'package:chat_play/app/data/models/media_entity.dart';
import 'package:chat_play/app/data/models/page_list_entity.dart';
import 'package:chat_play/app/data/models/relations_entity_entity.dart';
import 'package:chat_play/app/data/models/user_entity.dart';
import 'package:chat_play/core/config/im_manager.dart';
import 'package:chat_play/core/network/resp_entity.dart';

import '../../../core/network/api.dart';
import '../../../core/network/net_service.dart';

class UserService {
  ///请求自己的profile传空
  static Future<UserEntity?> getProfile({String? id}) async {
    if (id == null) {
      return await NetService.get(Api.profile, UserEntity.fromJson, endOfPath: '/profile');
    } else {
      return await NetService.get(Api.profile, UserEntity.fromJson, endOfPath: '/' + id + '/profile');
    }
  }

  /// 更新自己的Profile
  static Future<UserEntity?> updateProfile({String? avatar, String? birthday, String? gender, String? nickname, String? intro}) async {
    Map<String, dynamic> body = {};
    if (avatar != null) body['avatar'] = avatar;
    if (birthday != null) body['birthday'] = birthday;
    if (gender != null) body['gender'] = gender;
    if (nickname != null) body['nickname'] = nickname;
    if (intro != null) body['intro'] = intro;

    UserEntity? userEntity = await NetService.put(Api.profile, UserEntity.fromJson, body: body);
    if (userEntity != null) await IMManager.instance.updateUserInfo(userEntity);
    return userEntity;
  }


  /// 添加喜欢
  static Future<RespEntity?> addLike({String? toUserId}) async {
    Map<String, dynamic> body = {'toUserId': toUserId};

    return await NetService.post<RespEntity>(Api.addLike, RespEntity.fromJson, body: body);
  }

  /// 我的好友
  static Future<PageListEntity<RelationsEntityEntity>?> getFriends({int number = 1, int size = 10}) async {
    return await NetService.get(Api.friends, PageListEntity<RelationsEntityEntity>.fromJson, query: {'number': number.toString(), 'size': size.toString()});
  }

}
