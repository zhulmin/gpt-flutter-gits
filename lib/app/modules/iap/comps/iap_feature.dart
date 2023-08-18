import 'package:flutter/cupertino.dart';
import 'package:gpt_flutter/core/ui/picture.dart';
import 'package:gpt_flutter/core/ui/text.dart';

class IapFeature extends StatelessWidget {
const IapFeature({ Key? key, required this.icon, required this.title }) : super(key: key);

  final String icon;
  final String title;
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: <Widget>[
    
          PictureX(icon),
          SizedBox(width:16),
          title.text(font: JFont.s18)
        ],
      ),
    );
  }
}