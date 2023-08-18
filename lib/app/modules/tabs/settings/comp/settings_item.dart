import 'package:flutter/material.dart';
import 'package:gpt_flutter/app/modules/tabs/settings/settings_controller.dart';
import 'package:gpt_flutter/core/ui/colors.dart';
import 'package:gpt_flutter/core/ui/picture.dart';
import 'package:gpt_flutter/core/ui/text.dart';
import 'package:gpt_flutter/generated/assets.dart';

class SettingsItem extends StatelessWidget {
const SettingsItem({ Key? key, required this.model, required this.onClick }) : super(key: key);
  
  final SettingsItemModel model;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: (){
        onClick();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 62,
        child: Row(
          children: <Widget>[
            PictureX(model.icon),
            SizedBox(width: 16),
            model.title.text(font: JFont.r16,color: JColors.tipText),
            Spacer(),
            PictureX(Assets.imagesCommonOpen)
    
          ],
        ),
      ),
    );
  }
}