// ignore_for_file: avoid_print

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trpg_tool/core/models/career.dart';
import 'package:trpg_tool/pages/coc_card/logic.dart';
import 'package:trpg_tool/pages/roll_dice/logic.dart';

import 'package:trpg_tool/tools/toast.dart';
import 'package:window_manager/window_manager.dart';

import 'config.dart';

class Global {
  static Global? _instance;
  static Global get instance => _instance ??= Global();

  static MyLogger log = MyLogger();
  static Toast t = Toast();
  static late SharedPreferences local;
  static bool test = false;
  static List<Career> careerList = [];

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await getCareerList();
    if (GetPlatform.isDesktop) {
      await windowManager.ensureInitialized();
      const windowOptions =
          WindowOptions(size: Size(1080 / 3, 2412 / 3), center: true);
      windowManager.waitUntilReadyToShow(windowOptions, () async {
        await windowManager.show();
        await windowManager.focus();
      });
    }

    local = await SharedPreferences.getInstance();
    SystemUiOverlayStyle systemUiOverlayStyle =
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    initLogic();
  }

  static Future<void> getCareerList() async {
    final rawData = await rootBundle.loadString(APPConfig.careerTablePath);
    final result = const CsvToListConverter().convert(rawData, eol: '\r\n');
    careerList = Career.fromList(result);
  }

  static void initLogic() {
    Get.put(RollDiceLogic());
    Get.put(CocCardLogic());
  }

  static void unfocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static Future<void> cleanAllLocalKey() async {
    await local.clear();
  }
}

class MyFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    // 允许release打印日志
    return true;
  }
}

class MyLogger {
  Logger log = Logger(filter: MyFilter());
  List<String> logList = [];

  static const key = '秋月';

  void d(String text) {
    logList.add(text);
    print("$key $text");
  }

  void e(String text) {
    logList.add(text);
    log.e("$key $text");
  }

  void i(String text) {
    logList.add(text);
    log.i("$key $text");
  }
}
