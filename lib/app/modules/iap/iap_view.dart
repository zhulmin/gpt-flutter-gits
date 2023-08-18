import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gpt_flutter/app/modules/iap/comps/iap_feature.dart';
import 'package:gpt_flutter/app/modules/iap/comps/iap_sub.dart';
import 'package:gpt_flutter/core/config/comom.dart';
import 'package:gpt_flutter/core/ui/colors.dart';
import 'package:gpt_flutter/core/ui/container.dart';
import 'package:gpt_flutter/core/ui/picture.dart';
import 'package:gpt_flutter/core/ui/text.dart';
import 'package:gpt_flutter/generated/assets.dart';

import 'iap_controller.dart';

class IapView extends GetView<IapController> {
  const IapView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            child: Center(
                child:
                    PictureX(Assets.imagesCommonClose, width: 16, height: 16)),
            onTap: () {
              Get.back();
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: GestureDetector(
                child: 'Restore'.text(font: JFont.r16),
                onTap: () {
                  logDev('Restore');
                },
              ),
            )
          ],
        ),
        body: Stack(
          children: [
            PictureX(Assets.imagesPng20xPremiumBg),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 293),
                  '解锁更多功能'.text(font: JFont.b24),
                  SizedBox(height: 32),
                  IapFeature(
                      icon: Assets.imagesIapPremiumUnlimited, title: '无限使用'),
                  IapFeature(
                      icon: Assets.imagesIapPremiumScene, title: '更多使用场景'),
                  IapFeature(
                      icon: Assets.imagesIapPremiumWord, title: '解锁长度限制'),
                  SizedBox(height: 32),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Obx(() => GestureDetector(
                            onTap: () => controller.subSelectedIndex.value = 0,
                            child: IapSub(
                                time: '1周',
                                desc: '优惠70%',
                                fee: controller.feeList[0],
                                isSelected:
                                    controller.subSelectedIndex.value == 0))),
                        SizedBox(
                          width: 16,
                        ),
                        Obx(() => GestureDetector(
                            onTap: () => controller.subSelectedIndex.value = 1,
                            child: IapSub(
                                time: '12个月',
                                desc: '优惠70%',
                                fee: controller.feeList[1],
                                isSelected:
                                    controller.subSelectedIndex.value == 1))),
                        SizedBox(
                          width: 16,
                        ),
                        Obx(() => GestureDetector(
                            onTap: () => controller.subSelectedIndex.value = 2,
                            child: IapSub(
                                time: '永久使用',
                                desc: '限时特价',
                                fee: controller.feeList[2],
                                isSelected:
                                    controller.subSelectedIndex.value == 2))),
                      ],
                    ),
                  ),
                  SizedBox(height: 48),
                  Center(
                    child: SizedBox(
                      width: 328,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: JColors.primary,
                          // foregroundColor: JColors.primary,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))
                        ),
                        onPressed: () {},
                        child: 'Continue'
                            .text(font: JFont.m16, color: JColors.background),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
