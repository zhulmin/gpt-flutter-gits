//create container class

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gpt_flutter/core/ui/picture.dart';

class ContainerX extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget? child;
  final double? radius;
  final Color? color;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? borderColor;
  final double borderWidth;
  
  ContainerX(
      {Key? key,
      this.child,
      this.width,
      this.padding,
      this.margin,
      this.height, this.radius, this.color, this.borderColor, this.borderWidth = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      padding: padding,
            margin: margin,
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: borderColor == null ? null : Border.all(color: borderColor!,width: borderWidth),
        color: color,
        borderRadius: radius == null ? null : BorderRadius.all(Radius.circular(radius!))
      ));
  }
}

class ContainerPic extends StatelessWidget {
  final double? width;
  final double? height;
  final String backgourndSvgPath;
  final Widget child;
  ContainerPic(
      {Key? key,
      required this.child,
      required this.backgourndSvgPath,
      this.width,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        PictureX(backgourndSvgPath, width: width, height: height),
        Positioned.fill(child: child),
      ],
    ));
  }
}
