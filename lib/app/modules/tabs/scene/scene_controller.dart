import 'package:get/get.dart';
import 'package:gpt_flutter/app/data/models/group_entity.dart';
import 'package:gpt_flutter/core/utils/in_app_review.dart';
import 'package:gpt_flutter/generated/assets.dart';

class SceneController extends GetxController {
  //TODO: Implement SceneController

  List<GroupEntity> list = [];

  @override
  void onInit() {
    super.onInit();

    //TODO: 如果没有数据, 要另外请求

    List<Map<String, Object>> jsons = [
      {
        //TODO: 先用本地的, 之后要改成网络图片, 网络加载...配置
        "iconUrl": Assets.imagesSceneLife,
        "title": "生活",
        "color": 0xff49DE73,
        "questions": [
          {"content": "菜谱: 广式隔水蒸鸡怎么做好吃"},
          {"content": "心理咨询:  有一些奇怪的癖好是怎么回事"}
        ]
      },
      {
        "title": "趣味",
        "iconUrl": Assets.imagesSceneFun,
        "color": 0xffFDFE27,
        "questions": [
          {"content": "内容1"},
          {"content": "内容2"},
          {"content": "内容2"}
        ]
      },
      {
        "title": "工作",
        "iconUrl": Assets.imagesSceneWork,
        "color": 0xff33CBFF,
        "questions": [
          {"content": "内容1"},
          {"content": "内容2"},
          {"content": "内容2"}
        ]
      }
    ];
    for (var element in jsons) {
      list.add(GroupEntity.fromJson(element));
    }
  }
}
