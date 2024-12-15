import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import 'package:trpg_tool/common/global.dart';
import 'package:trpg_tool/widget/extension_widget.dart';

class Toast {
  final duration = const Duration(seconds: 2);
  final longDuration = const Duration(seconds: 10);

  void p() {
    if (Global.test) return;
    Get.dialog(const TDCircleIndicator(size: 30).center(),
        barrierDismissible: false);
  }

  void r() {
    if (Global.test) return;
    Get.dialog(TDAlertDialog(
        title: "确定退出",
        rightBtnAction: () {
          Get.back();
        }));
  }

  void myDialog(Function() onTop,
      {String title = '标题', String content = '内容'}) {
    if (Global.test) return;

    Get.dialog(
        AlertDialog(title: Text(title), content: Text(content), actions: [
      TextButton(child: const Text('取消'), onPressed: () => Get.back()),
      TextButton(child: const Text('确定'), onPressed: () => onTop())
    ]));
  }

  void s(String text, {bool long = false}) {
    if (Global.test) return;

    EasyLoading.showSuccess(text, duration: long ? longDuration : duration);
  }

  void e(String text, {bool long = false}) {
    if (Global.test) return;

    EasyLoading.showError(text, duration: long ? longDuration : duration);
  }

  void i(String text, {bool long = false}) {
    if (Global.test) return;

    EasyLoading.showInfo(text, duration: long ? longDuration : duration);
  }

  void t(String text,
      {EasyLoadingToastPosition toastPosition = EasyLoadingToastPosition.center,
      bool long = false}) {
    if (Global.test) return;

    cancel();
    EasyLoading.showToast(text, duration: long ? longDuration : duration);
  }

  void ct(String text) {
    t(text);
  }

  void tt(String text) {
    t(text, toastPosition: EasyLoadingToastPosition.top);
  }

  void bt(String text) {
    t(text, toastPosition: EasyLoadingToastPosition.bottom);
  }

  void cancel() {
    if (Global.test) return;
    EasyLoading.dismiss();
    if (Get.isDialogOpen ?? false) Get.back();
  }
}
