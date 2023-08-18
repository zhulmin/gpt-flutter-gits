import 'package:flutter/material.dart';
import 'package:gpt_flutter/app/data/models/group_entity.dart';
import 'package:gpt_flutter/app/data/models/question_entity.dart';
import 'package:gpt_flutter/core/ui/colors.dart';
import 'package:gpt_flutter/core/ui/container.dart';
import 'package:gpt_flutter/core/ui/picture.dart';
import 'package:gpt_flutter/core/ui/text.dart';
import 'package:gpt_flutter/generated/assets.dart';
import '../../../../../core/config/comom.dart';


class SceneItem extends StatelessWidget {

//TOD: 这个也应该是后端配置, 后端要记录点击率, 直接用网络图片svg
  final StringCallback onClick;
  final GroupEntity group;
  const SceneItem(
      {Key? key,
      required this.group, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SceneItemTitle(group: group),
        if (group.questions != null)
        Container(
          decoration: BoxDecoration(
             color: JColors.inputBackground,
             borderRadius: BorderRadius.all(Radius.circular(14))
          ),
          child: Column(children: group.questions!.asMap().entries.map((e) {
          return SceneItemContent(question: e.value,isFirst: e.key == 0,color: group.color, onClick: onClick);
          }).toList()
          ))
      ],
    );
  }
}

class SceneItemTitle extends StatelessWidget {
  const SceneItemTitle({Key? key, required this.group}) : super(key: key);
  final GroupEntity group;
  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.only(top: 8), height: 64,child: Row(children: [
     SizedBox(width:13),
     PictureX(group.iconUrl!,width: 24,height: 24,fit: BoxFit.contain,),
     SizedBox(width: 8),
      if (group.title != null) 
      group.title!.text(font: JFont.r16)
    ]));
  }
}

class SceneItemContent extends StatelessWidget {
  const SceneItemContent({Key? key, required this.question, required this.isFirst, required this.color, required this.onClick}) : super(key: key);
  final bool isFirst;
  final int? color;
  final QuestionEntity question;
  final StringCallback onClick;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onClick(question.id ?? 'ID is needed');
      },
      child: Container(
        decoration: isFirst ? null:BoxDecoration(
           border: Border(top: BorderSide(color: Colors.white.withOpacity(0.1),width: 1))
        ),
        height: 70,
        child: question.content != null ? Row(
          children: [
            ContainerX(
              margin:EdgeInsets.only(top: 3,left: 13,right: 13),
              color: Color(color ?? 0xffffff),
              width: 6 ,
              height: 6,
              radius: 3,
              ),
            question.content!.text(font: JFont.r14),
            Spacer(),
            PictureX(Assets.imagesCommonOpen),
            SizedBox(width: 20)
          ],
        ) : null,
      ),
    );
  }
}
