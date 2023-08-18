import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gpt_flutter/app/modules/tabs/settings/comp/settings_item.dart';
import 'package:gpt_flutter/app/routes/app_pages.dart';
import 'package:gpt_flutter/core/ui/picture.dart';
import 'package:gpt_flutter/core/ui/text.dart';
import 'package:gpt_flutter/generated/assets.dart';

import 'settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SettingsView'),
        centerTitle: true,
      ),
      body: Center(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding:
                  EdgeInsets.only(left: 20, top: 32, bottom: 23, right: 20),
              sliver: SliverToBoxAdapter(
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.IAP);
                  },
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        PictureX(Assets.imagesSettingsRocket),
                        Column(
                          children: <Widget>[
                            'title'.text(font: JFont.e16),
                            'description'.text(font: JFont.r14)
                          ],
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        gradient: LinearGradient(
                            colors: [Color(0xff1b282f), Color(0xff53b692)])),
                  ),
                ),
              ),
            ),
            ...controller.list.map((e) => SliverToBoxAdapter(
              child: SettingsItem(model: e,onClick: () {
                print(e.title);

                controller.action(e);
     
              },),
            ))
          ],
        ),
      ),
    );
  }
}
