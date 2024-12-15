import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trpg_tool/pages/home/page.dart';
import 'package:trpg_tool/pages/log_list/page.dart';

import 'package:trpg_tool/pages/splash/page.dart';

class AppRoutes {
  static String initRoute = routes[0].name;

  static GetPage page(String name, Widget child) {
    return GetPage(name: name, page: () => child, binding: MyBinding());
  }

  static GetPage splash = page('/splash', const SplashPage());
  static GetPage home = page('/home', const HomePage());
  static GetPage logList = page('/logList', const LogListPage());

  // static GetPage  = page('/', const ());
  static List<GetPage> routes = [splash, home];
}

class MyBinding extends Bindings {
  @override
  void dependencies() {
    // ignore: unused_local_variable
    final cr = Get.currentRoute;
    // if (cr == AppRoutes..name) {
    //   Get.put(());
    // }
    if (cr == AppRoutes.splash.name) {
      Get.put(SpLashLogic());
    }
  }
}
