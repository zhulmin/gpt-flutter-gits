import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class PictureX extends StatelessWidget {
  final Color? color;
  final String localPath;
  final double? width;
  final double? height;
  final BoxFit fit;
  PictureX(this.localPath, {Key? key, this.color, this.width, this.height, this.fit = BoxFit.contain}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!localPath.contains('svg')) {
      return Image.asset(localPath, width: width, height: height, fit: fit);
    }
    var svg = SvgPicture.asset(localPath, colorFilter: color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn), width: width, height: height, fit: fit);
    if (width != null && height != null) {
      return SizedBox(child: FittedBox(child: svg, fit: BoxFit.fill), width: width, height: height);
    }
    return svg;
  }
}

/*
* primary color
*
* */
class PrimaryColorPicture extends StatelessWidget {
  final String localPath;

  const PrimaryColorPicture({Key? key, required this.localPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      localPath,
      //主题色
      // colorFilter: ColorFilter.mode(color!, BlendMode.srcIn)
    );
  }
}
