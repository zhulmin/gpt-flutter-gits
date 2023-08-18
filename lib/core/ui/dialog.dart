import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:get/get.dart';

class DialogX {
  static void sheet() {
    BuildContext? context = Get.context;
    if (context == null) return;
    showPlatformModalSheet(context: context, builder: (_) => Text('data'));
  }

  static void alert(String content,
      {String? title,
      String? confirmText,
      String? cancelText,
      VoidCallback? confirmCallback,
      VoidCallback? cancelCallback}) {
    BuildContext? context = Get.context;
    if (context == null) return;
    showPlatformDialog(
      context: context,
      builder: (_) => PlatformAlertDialog(
        title: title == null ? null : Text(title),
        content: Text(content),
        actions: <Widget>[
          if (cancelText != null)
            PlatformDialogAction(
              child: PlatformText(cancelText),
              onPressed: () {
                Navigator.pop(context);
                cancelCallback?.call();
              },
            ),
          if (confirmText != null)
            PlatformDialogAction(
                child: PlatformText(confirmText),
                onPressed: () {
                  Navigator.pop(context);
                  confirmCallback?.call();
                }),
          if (confirmText == null && cancelText == null)
            PlatformDialogAction(
                child: PlatformText('Ok'),
                onPressed: () {
                  Navigator.pop(context);
                }),
        ],
      ),
    );
  }
}
