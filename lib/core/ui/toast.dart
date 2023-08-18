import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToastY {
  static void showSuccess(String? text) {
    if (text == null) return;
    safeShowSnackbar(icon: Icon(Icons.done), message: text);
  }

  static void showError(String? text) {
    if (text == null) return;
    safeShowSnackbar(icon: Icon(Icons.error), message: text);
  }

  static void showInfo(String? text, {String? title}) {
    if (text == null) return;
    safeShowSnackbar(
        icon: Icon(Icons.info), title: title, message: text);
  }

  static void safeShowSnackbar({Widget? icon, String? title, String? message}) {

    if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar().then((value) {
      showSnackbar(icon: icon,title: title,message: message);  
      });
    }else {
      showSnackbar(icon: icon,title: title,message: message);
    }
  }

  static void showSnackbar({Widget? icon, String? title, String? message}) {
    GetSnackBar snackBar = GetSnackBar(
        icon: icon,
        title: title,
        message: message,
        duration: Duration(seconds: 2),
        borderRadius: 16,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Color.fromARGB(255, 32, 55, 87),
        margin: EdgeInsets.symmetric(horizontal: 44, vertical: 0),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20));

    Get.showSnackbar(snackBar);
  }
}
