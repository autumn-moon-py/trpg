import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import 'package:trpg_tool/common/config.dart';
import 'package:trpg_tool/tools/tools.dart';
import 'package:trpg_tool/widget/extension_widget.dart';
import 'package:trpg_tool/widget/small.dart';
import 'package:velocity_x/velocity_x.dart';

import 'logic.dart';
import 'widget.dart';

class CocCardPage2 extends GetView<CocCardLogic> {
  const CocCardPage2({super.key});

  Widget attributesInputItem(String key, TextEditingController numberC,
      [bool haveHalf = true]) {
    String text = APPConfig.attributesChineseMap[key] ?? '';
    if (text.isEmpty) {
      text = APPConfig.derivedStatsChineseMap[key] ?? "";
    }
    if (text.isEmpty) {
      text = key;
    }
    final halfAndFifth = getHalfAndFifth(int.tryParse(numberC.text) ?? 0);

    return Column(children: [
      Row(
          mainAxisSize: MainAxisSize.min,
          children: [TDText(text), sb(20.w), TDText(key)]),
      TDInput(
          maxLength: 2,
          focusNode: controller.focusMap[key],
          width: 1.sw / 3 - 10.w,
          contentPadding: EdgeInsets.only(bottom: 10.h),
          controller: numberC,
          needClear: false,
          contentAlignment: TextAlign.center,
          inputType: TextInputType.number,
          backgroundColor: Colors.transparent),
      if (haveHalf)
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          TDText(halfAndFifth.$1.toString()),
          TDText(halfAndFifth.$2.toString())
        ]).w(1.sw / 3 - 10.w)
    ]).decorated(color: Vx.white);
  }

  Widget attributesList() {
    return GetBuilder(
        id: "attributes",
        init: CocCardLogic(),
        builder: (context) {
          final list = controller.attributesMap.keys.toList();

          return Wrap(
              spacing: 10.w,
              runSpacing: 20.h,
              children: list
                  .map((e) => attributesInputItem(e, controller.textCMap[e]!))
                  .toList());
        });
  }

  Widget derivativeAttributesList() {
    return GetBuilder(
        id: "attributes",
        init: CocCardLogic(),
        builder: (context) {
          final list = controller.derivedStatsMap.keys.toList();

          return Wrap(
              spacing: 10.w,
              runSpacing: 20.h,
              children: list
                  .map((e) =>
                      attributesInputItem(e, controller.textCMap[e]!, false))
                  .toList());
        });
  }

  Widget totalW() {
    return GetBuilder(
        id: "attributes",
        init: CocCardLogic(),
        builder: (_) {
          int value = controller.totalAttributes.value;
          bool includeLuck = controller.includeLuck.value;

          return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            TDText("总点:$value").hide(isVisible: !includeLuck),
            sb(20.w),
            TDText("总点(含运):$value").hide(isVisible: includeLuck)
          ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
        child: Scaffold(
            body: Stack(children: [
      ListView(children: [
        cardBG(
            title: "生成设置",
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              baseRow("总点数", baseInputW(controller.attributesTotalTextC)),
              sb(0, 20.h),
              baseRow("完全分配", Obx(() {
                return TDSwitch(
                    isOn: !controller.distributeAllPoints.value,
                    onChanged: (value) =>
                        controller.distributeAllPoints.value = !value);
              })),
              sb(0, 20.h),
              baseRow("总点数包含幸运", Obx(() {
                return TDSwitch(
                    isOn: controller.includeLuck.value,
                    onChanged: (value) => controller.includeLuck.value = value);
              })),
            ])).padding(horizontal: 40.w),
        Row(children: [
          fullButton("清空", () {
            controller.clear();
          }).expanded(),
          sb(40.w),
          fullButton("生成属性", () {
            controller.rollAttributes();
          }).expanded(),
        ]).padding(horizontal: 20.w, vertical: 40.h),
        cardBG(
            title: "基础属性",
            child: Column(children: [
              totalW(),
              sb(0, 40.h),
              attributesList(),
            ])),
        sb(0, 40.h),
        cardBG(title: "衍生属性", child: derivativeAttributesList())
      ])
    ])));
  }
}
