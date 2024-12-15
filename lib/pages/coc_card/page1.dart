import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import 'package:trpg_tool/core/models/skill.dart';
import 'package:trpg_tool/pages/coc_card/logic.dart';
import 'package:trpg_tool/pages/coc_card/widget.dart';
import 'package:trpg_tool/widget/big.dart';
import 'package:trpg_tool/widget/small.dart';
import 'package:velocity_x/velocity_x.dart';

class CocCardPage1 extends GetView<CocCardLogic> {
  const CocCardPage1({super.key});

  Widget nameInputW() {
    return baseRow(
        "姓名",
        Row(children: [
          baseInputW(controller.nameTextC),
          sb(20.w),
          diceButton(() {
            controller.nameTextC.text = controller.investigator.randomName();
          })
        ]).expand());
  }

  Widget genderInputW() {
    return baseRow(
        "性别",
        Row(children: [
          baseInputW(controller.genderTextC),
          sb(20.w),
          diceButton(() {
            controller.genderTextC.text =
                controller.investigator.randomGender();
          })
        ]));
  }

  Widget eraPicker() {
    return baseRow(
        "时代背景",
        dropdownPickerW(controller.investigator.eras, onChange: (value) {
          controller.investigator.era = value;
        }));
  }

  Widget languagePicker() {
    return baseRow(
        "母语",
        dropdownPickerW(languageReverseMap.keys.toList(), onChange: (value) {
          controller.investigator.language = languageReverseMap[value]!;
        }));
  }

  Widget ageInputW() {
    return baseRow("年龄", baseInputW(controller.ageTextC));
    // return BetterIntegerInputWidget(
    //     title: "年龄", textC: controller.ageTextC, min: 5);
  }

  Widget birthplaceInputW() {
    return baseRow("出生地", baseInputW(controller.birthplaceTextC));
  }

  Widget residenceInputW() {
    return baseRow("现居地", baseInputW(controller.residenceTextC));
  }

  Widget baseInfoW() {
    final p = sb(0, 40.h);

    return cardBG(
        title: "基本信息",
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          nameInputW(),
          p,
          genderInputW(),
          p,
          eraPicker(),
          p,
          languagePicker(),
          p,
          ageInputW(),
          p,
          birthplaceInputW(),
          p,
          residenceInputW()
        ]));
  }

  Widget skillLimit() {
    return cardBG(
        title: "技能上限",
        child: Column(children: [
          BetterIntegerInputWidget(
              title: "职业技能上限",
              textC: controller.skillTextC1,
              showMoreAdjustment: true),
          sb(0, 20.h),
          BetterIntegerInputWidget(
              title: "兴趣技能上限",
              textC: controller.skillTextC2,
              showMoreAdjustment: true)
        ]));
  }

  @override
  Widget build(BuildContext context) {
    final p = sb(0, 40.h);
    return Scaffold(
      appBar: TDNavBar(
        title: "COC车卡",
        useDefaultBack: false,
        rightBarItems: [
          TDNavBarItem(icon: Icons.arrow_forward_outlined, action: () {})
        ],
      ),
      body: Column(children: [p, baseInfoW(), p, skillLimit()])
          .paddingSymmetric(horizontal: 40.w),
    );
  }
}
