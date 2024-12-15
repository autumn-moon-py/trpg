import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import 'package:trpg_tool/common/global.dart';
import 'package:trpg_tool/core/models/roll.dart';
import 'package:trpg_tool/pages/coc_card/logic.dart';
import 'package:trpg_tool/tools/play_audio.dart';
import 'package:trpg_tool/tools/roll_dice.dart';
import 'package:trpg_tool/tools/tools.dart';

class RollDiceLogic extends GetxController {
  final taskLevel = SuccessLevel.normal.obs;

  int other = 0;

  void showDialogInput() {
    final textC = TextEditingController();
    showGeneralDialog(
      context: Get.context!,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return TDInputDialog(
            title: "rd100",
            textEditingController: textC,
            rightBtn: TDDialogButtonOptions(
                title: "确认",
                action: () async {
                  Global.unfocus();
                  Get.back();
                  Global.t.p();
                  other = int.tryParse(textC.text) ?? 0;
                  await roll100();
                }));
      },
    );
  }

  void changeTaskLevel(SuccessLevel value) {
    taskLevel.value = value;
  }

  Future<void> roll100() async {
    String text = "";
    final nowValue = other;
    text += "当前值$nowValue,";
    switch (taskLevel.value) {
      case SuccessLevel.normal:
        text += "常规";
        break;
      case SuccessLevel.hard:
        text += "困难";
        break;
      case SuccessLevel.extreme:
        text += "极难";
        break;
      default:
    }
    final playAudio = PlayAudio();
    playAudio.setDiceAudio();
    await playAudio.play();

    // final tts = TTS();
    // await tts.init(() {
    //   Global.t.cancel();
    // });

    final rd100 = RollDice.rd100();
    // const rd100 = 100;
    text += "rd一百 结果$rd100,";

    final halfAndFifthList = getHalfAndFifth(nowValue);
    final success = checkRollSuccess(nowValue, rd100, halfAndFifthList.$1,
        halfAndFifthList.$2, taskLevel.value);
    if (rd100 == 1) {
      text += "大成功";
    } else {
      if (success) {
        text += "成功";
      } else {
        if (rd100 >= 96) {
          if (rd100 == 100 && nowValue >= 50) {
            text += "大失败";
          }
          if (nowValue < 50) {
            text += "大失败";
          }
        } else {
          text += "失败";
        }
      }
    }
    Global.log.d(text);
    await Future.delayed(const Duration(milliseconds: 500));
    // await tts.speak(text);
  }

  Future<void> rollAttribute(
      String name, int nowValue, SuccessLevel level) async {
    String text = "";
    switch (level) {
      case SuccessLevel.normal:
        text += "常规";
        break;
      case SuccessLevel.hard:
        text += "困难";
        break;
      case SuccessLevel.extreme:
        text += "极难";
        break;
      default:
    }
    text += "任务,";
    text += "当前$name$nowValue,";
    final playAudio = PlayAudio();
    playAudio.setDiceAudio();
    await playAudio.play();

    // final tts = TTS();
    // await tts.init(() {
    //   Global.t.cancel();
    // });

    final rd100 = RollDice.rd100();
    text += "rd一百 结果$rd100,";
    final halfAndFifthList = getHalfAndFifth(nowValue);
    final success = checkRollSuccess(nowValue, rd100, halfAndFifthList.$1,
        halfAndFifthList.$2, taskLevel.value);
    if (rd100 == 1) {
      text += "大成功";
    } else {
      if (success) {
        text += "成功";
      } else {
        text += "失败";
      }
    }
    Global.log.d(text);
    await Future.delayed(const Duration(milliseconds: 500));
    // await tts.speak(text);
  }

  int getAttribute(String str) {
    final logic = Get.find<CocCardLogic>();
    return logic.attributesMap[str] ?? 0;
  }
}
