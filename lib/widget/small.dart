import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import 'package:trpg_tool/widget/extension_widget.dart';
import 'package:velocity_x/velocity_x.dart';

Widget sb([double? width, double? height]) {
  return SizedBox(width: width, height: height);
}

Widget fullButton(String title, void Function() callback) {
  return TDButton(
      text: title,
      height: 40,
      size: TDButtonSize.large,
      type: TDButtonType.fill,
      shape: TDButtonShape.rectangle,
      theme: TDButtonTheme.primary,
      onTap: callback);
}

void normalPickerW(
    String title, List<String> data, void Function(int) onChange) {
  TDPicker.showMultiPicker(Get.context!, title: title, data: [data],
      onConfirm: (list) {
    final index = list.first;
    onChange(index);
  });
}

Widget toTopButton(ScrollController controller) {
  return TDBackTop(controller: controller);
}

Widget dropdownPickerW(List<String> list, {void Function(String)? onChange}) {
  var nowValue = "".obs;
  nowValue.value = list.first;

  return Obx(() {
    return DropdownButton(
        value: nowValue.value,
        underline: sb(),
        borderRadius: BorderRadius.circular(5),
        onChanged: (value) {
          nowValue.value = value ?? "";
          onChange?.call(nowValue.value);
        },
        items: list.map((value) {
          return DropdownMenuItem(value: value, child: TDText(value));
        }).toList());
  }).h(100.h).padding(left: 40.w).decorated(
      color: Vx.white,
      border: Border.all(color: Vx.gray400, width: 1),
      borderRadius: BorderRadius.circular(5));
}

Widget baseRow(String title, Widget child) {
  return Row(
      mainAxisSize: MainAxisSize.min,
      children: [TDText(title), sb(15.w), child]);
}

Widget baseInputW(TextEditingController controller) {
  return TextField(
          controller: controller,
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              contentPadding: EdgeInsets.only(left: 20.w, bottom: 40.h)))
      .w(400.w)
      .h(100.h)
      .color(Vx.white);
}

Widget diceButton(void Function() callback) {
  return const TDText("🎲").onTap(() {
    callback.call();
  });
}

void test() {
  // appbar
  const TDNavBar(title: "标题");
  // 步骤条
  const TDSteps(steps: []);
  const TDCollapse(children: []);
}
