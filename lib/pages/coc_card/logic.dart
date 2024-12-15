import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trpg_tool/common/config.dart';
import 'package:trpg_tool/common/global.dart';
import 'package:trpg_tool/core/models/investigator.dart';
import 'package:trpg_tool/tools/base_attributes.dart';
import 'package:trpg_tool/tools/tools.dart';

class CocCardLogic extends GetxController {
  Map<String, int> attributesMap = {
    'STR': 0,
    'CON': 0,
    'SIZ': 0,
    'DEX': 0,
    'APP': 0,
    'INT': 0,
    'POW': 0,
    'EDU': 0,
  };
  Map<String, String> derivedStatsMap = {
    "DB": "",
    "Build": "",
    "MOV": "",
    "HP": "",
    "MP": "",
    "SAN": "",
  };
  final investigator = Investigator();
  final attributesTool = BaseAttributes();

  Map<String, TextEditingController> textCMap = {};
  Map<String, FocusNode> focusMap = {};

  var totalAttributes = 0.obs;
  final skillTextC1 = TextEditingController();
  final skillTextC2 = TextEditingController();
  final nameTextC = TextEditingController();
  final genderTextC = TextEditingController();
  final ageTextC = TextEditingController();
  final birthplaceTextC = TextEditingController();
  final residenceTextC = TextEditingController();
  final attributesTotalTextC = TextEditingController();
  var includeLuck = false.obs;
  var distributeAllPoints = false.obs;
  final pageC = PageController();

  final skillLimit = [0, 0, 0, 0];

  @override
  void onInit() {
    initTextC();
    attributesTool.roll = true;
    super.onInit();
  }

  void checkInput1() {
    final controllers = [
      skillTextC1,
      skillTextC2,
      nameTextC,
      genderTextC,
      ageTextC,
      birthplaceTextC,
      residenceTextC
    ];
    for (var controller in controllers) {
      if (controller.text.isEmpty) {
        Global.t.t("还有信息没有填完");
        return;
      }
    }
    investigator.name = nameTextC.text;
    investigator.gender = genderTextC.text;
    investigator.age = int.tryParse(ageTextC.text) ?? 0;
    investigator.hometown = birthplaceTextC.text;
    investigator.home = residenceTextC.text;
    skillLimit[0] = int.tryParse(skillTextC1.text) ?? 0;
    skillLimit[1] = int.tryParse(skillTextC2.text) ?? 0;
  }

  void initTextC() {
    for (var key in attributesMap.keys) {
      final c = TextEditingController();
      c.addListener(() {
        attributesMap[key] = int.tryParse(c.text) ?? 0;
      });
      final value = attributesMap[key]!.toString();
      c.text = value;
      textCMap[key] = c;
    }
    textCMap["LUK"] = TextEditingController();
    for (var key in derivedStatsMap.keys) {
      final c = TextEditingController();
      c.addListener(() {
        derivedStatsMap[key] = (int.tryParse(c.text) ?? 0).toString();
      });
      final value = derivedStatsMap[key]!.toString();
      c.text = value;
      textCMap[key] = c;
    }
    for (var key in textCMap.keys) {
      final f = FocusNode();
      f.addListener(() {
        calculateTotalAttributes();
      });
      focusMap[key] = f;
    }
    skillTextC1.text = 80.toString();
    skillTextC2.text = 60.toString();
  }

  void rollAttributes() {
    final total = int.tryParse(attributesTotalTextC.text);
    if (!includeLuck.value) {
      attributesMap.remove("LUK");
    }
    attributesMap = attributesTool.rollAttributes(
        totalSum: total,
        includeLuck: includeLuck.value,
        noDistributeAllPoints: distributeAllPoints.value);
    calculateTotalAttributes();
    if (!includeLuck.value) {
      const key = "LUK";
      attributesMap[key] = baseRollDice(APPConfig.attributesDiceMap[key]!);
    }
    derivedStatsMap = attributesTool.getDerivedStats();
    textCMap.forEach((key, value) {
      if (key == "LUK") {
        value.text = (attributesMap[key] ?? 0).toString();
      } else {
        if (attributesMap.containsKey(key)) {
          value.text = attributesMap[key]!.toString();
        } else {
          value.text = derivedStatsMap[key]!.toString();
        }
      }
    });
    update(["attributes"]);
  }

  void calculateTotalAttributes() {
    for (var c in Global.careerList) {
      c.formulaPoint(attributesMap);
    }
    int total = 0;
    for (var value in attributesMap.values) {
      total += value;
    }
    if (!includeLuck.value) {
      total -= attributesMap["LUK"] ?? 0;
    }
    totalAttributes.value = total;
    update(["attributes"]);
  }

  void clear() {
    for (var key in attributesMap.keys) {
      textCMap[key]!.text = "0";
      attributesMap[key] = 0;
    }
    for (var key in derivedStatsMap.keys) {
      textCMap[key]!.text = "0";
      derivedStatsMap[key] = "0";
    }
    totalAttributes.value = 0;
    update(["attributes"]);
  }
}
