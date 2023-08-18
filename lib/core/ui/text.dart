import 'package:flutter/material.dart';


 extension StringText on String {

  Text text({JFont font = JFont.r16, Color? color}) {
    return Text(this, style: TextStyle(fontSize: font.fontSize,fontWeight: font.fontWeight,color:color,fontFamily: 'BalooBhaijaan2'));
  }
}


enum JFont {
  
  //Medium
  m14(fontSize: 14,fontWeight: FontWeight.w500),

  m16(fontSize: 16,fontWeight: FontWeight.w500),

  //Semi-bold
  s18(fontSize: 18, fontWeight: FontWeight.w600),

  //regular 18
  //r18
  r18(fontSize: 18, fontWeight: FontWeight.normal),
  //16
  r16(fontSize: 16, fontWeight: FontWeight.normal),
  //14
  r14(fontSize: 14, fontWeight: FontWeight.normal),

  //b18
  b18(fontSize: 18, fontWeight: FontWeight.bold),
  
  //b24
  b24(fontSize: 24, fontWeight: FontWeight.bold),
  //b16
  b16(fontSize: 16, fontWeight: FontWeight.bold),
  //b14
  b14(fontSize: 14, fontWeight: FontWeight.bold),
  
    //e16
  e16(fontSize: 16, fontWeight: FontWeight.w800);
  

  final FontWeight fontWeight;
  final double fontSize;
  const JFont({required this.fontSize, required this.fontWeight}); 
  

  // static TextStyle b18 = TextStyle(
  //     fontSize: 18, fontWeight: FontWeight.bold, fontFamily: _fontFamily);
}

extension TextStyleWithColor on TextStyle {
  TextStyle withColor(Color? color) {
    return TextStyle(
        fontSize: this.fontSize,
        fontWeight: this.fontWeight,
        fontFamily: this.fontFamily,
        color: color ?? Colors.white);
  }
}
