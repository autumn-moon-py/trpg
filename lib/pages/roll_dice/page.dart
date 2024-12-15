import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import 'package:trpg_tool/common/config.dart';
import 'package:trpg_tool/common/global.dart';
import 'package:trpg_tool/core/models/roll.dart';
import 'package:trpg_tool/pages/roll_dice/logic.dart';
import 'package:trpg_tool/widget/extension_widget.dart';
import 'package:trpg_tool/widget/small.dart';

class RollDicePage extends GetView<RollDiceLogic> {
  const RollDicePage({super.key});

  Widget levelPickerW() {
    TDBottomTabBarTabConfig item(String title, SuccessLevel value) {
      return TDBottomTabBarTabConfig(
          tabText: title,
          onTap: () {
            controller.changeTaskLevel(value);
          });
    }

    return TDBottomTabBar(TDBottomTabBarBasicType.text,
        showTopBorder: false,
        navigationTabs: ['常规', "困难", "极难"]
            .map((title) => item(title, successLevelReverseMap[title]!))
            .toList());
  }

  Widget rollDicesList() {
    const chineseMap = APPConfig.attributesChineseMap;
    final list = chineseMap.keys.toList();
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (c, i) {
          final String key = list[i];
          final String now = chineseMap[key] ?? "";
          return fullButton("检定$now", () {
            Global.t.p();
            controller.rollAttribute(
                now, controller.getAttribute(key), controller.taskLevel.value);
          }).paddingSymmetric(horizontal: 150.w, vertical: 10.h);
        });
  }

  Widget otherRollW() {
    return fullButton("其他rd100", controller.showDialogInput);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      rollDicesList(),
      Column(
              mainAxisSize: MainAxisSize.min,
              children: [otherRollW(), levelPickerW()])
          .alignment(Alignment.bottomCenter)
    ]);
  }
}
