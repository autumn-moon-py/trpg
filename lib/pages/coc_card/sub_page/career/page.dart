import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import 'package:trpg_tool/common/global.dart';
import 'package:trpg_tool/core/models/career.dart';
import 'package:trpg_tool/pages/coc_card/sub_page/career/logic.dart';
import 'package:trpg_tool/tools/tools.dart';

class CareerPage extends GetView<CareerLogic> {
  const CareerPage({super.key});

  Widget listItem(Career now) {
    var isExpanded = false.obs;

    return Obx(() {
      return TDCollapse(
          style: TDCollapseStyle.block,
          expansionCallback: (int index, bool value) {
            isExpanded(!value);
          },
          children: [
            TDCollapsePanel(
                headerBuilder: (context, isExpanded) {
                  return TDText(now.name);
                },
                expandIconTextBuilder: (context, isExpanded) {
                  return isExpanded ? '收起' : '展开';
                },
                isExpanded: isExpanded.value,
                body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TDText("职业信用范围: ${now.creditRange}"),
                      TDText("职业点数: ${now.point}"),
                      TDText(
                          "本职技能: ${now.skillsStrList.toString().replaceBrackets()}"),
                    ]))
          ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    final list = Global.careerList;

    return Scaffold(
        appBar: const TDNavBar(title: "职业列表"),
        body: Stack(children: [
          ListView.builder(
              itemCount: list.length,
              itemBuilder: (c, index) {
                final now = list[index];
                return listItem(now);
              })
        ]));
  }
}
