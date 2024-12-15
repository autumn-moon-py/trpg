import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'common/global.dart';
import 'common/routes.dart';

Future<void> main() async {
  await Global.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1080, 2412),
        child: GetMaterialApp(
            title: "trpg工具",
            debugShowCheckedModeBanner: false,
            theme: ThemeData(useMaterial3: false),
            initialRoute: AppRoutes.initRoute,
            getPages: AppRoutes.routes,
            builder: EasyLoading.init()));
  }
}
