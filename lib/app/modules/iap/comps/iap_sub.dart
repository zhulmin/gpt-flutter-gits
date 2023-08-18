
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt_flutter/core/ui/colors.dart';
import 'package:gpt_flutter/core/ui/container.dart';
import 'package:gpt_flutter/core/ui/text.dart';

class IapSub extends StatelessWidget {
const IapSub({ Key? key, required this.time, required this.desc, required this.fee,this.isSelected = false}) : super(key: key);

 final String time;
//  final String timeUnit;
 final String desc;
 final String fee;
 final bool isSelected;

  @override
  Widget build(BuildContext context){

    final double width =  (Get.width - 24 * 2 - 16 * 2) / 3;

    return AnimatedScale(
      scale: isSelected ? 1 : 0.86,
      duration: Duration(milliseconds: 250),
      child: ContainerX(
        radius: 14,
        width:width,
        height: width / 108 * 144,
        color: isSelected ? JColors.primary.withOpacity(0.5) : JColors.inputBackground,
        borderColor: isSelected ? JColors.primary : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            time.text(),
            SizedBox(height: 10),
            desc.text(font: JFont.m14,color: Color(0xffFFE400)),
            SizedBox(height: 10),
            fee.text(),
    
          ],
        ),
      ),
    );
  }
}