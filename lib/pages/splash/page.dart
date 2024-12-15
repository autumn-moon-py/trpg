import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import 'package:trpg_tool/common/routes.dart';
import 'package:trpg_tool/widget/extension_widget.dart';

class SpLashLogic extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Get.offNamed(AppRoutes.home.name);
  }
}

class SplashPage extends GetView<SpLashLogic> {
  const SplashPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const TDCircleIndicator(size: 80).center();
  }
}
