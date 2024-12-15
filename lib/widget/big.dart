import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import 'package:trpg_tool/widget/extension_widget.dart';
import 'package:trpg_tool/widget/small.dart';
import 'package:velocity_x/velocity_x.dart';

import 'middle.dart';

class BetterIntegerInputWidget extends StatelessWidget {
  final int min;
  final int max;
  final double inputWidth;
  final double inputHeight;
  final String title;
  final TextEditingController textC;
  final bool showMoreAdjustment;

  const BetterIntegerInputWidget(
      {super.key,
      required this.title,
      required this.textC,
      this.min = 0,
      this.max = 99,
      this.inputWidth = 300,
      this.inputHeight = 100,
      this.showMoreAdjustment = false});

  void _handleButtonTap(bool add, int num, TextEditingController textC) {
    int currentNum = int.tryParse(textC.text) ?? 0;
    currentNum = add ? currentNum + num : currentNum - num;
    currentNum = currentNum.clamp(min, max);
    textC.text = currentNum.toString();
  }

  Widget _buildAdjustmentButtonsRow(TextEditingController textController) {
    List buttonConfigs = [
      (false, 1),
      (false, 5),
      (false, 10),
      (true, 1),
      (true, 5),
      (true, 10),
    ];
    if (!showMoreAdjustment) {
      buttonConfigs = [(false, 1), (false, 5), (true, 1), (true, 5)];
    }

    return Row(
        children: buttonConfigs
            .map((config) => _buildAdjustmentButton(config, textController))
            .toList());
  }

  Widget _buildAdjustmentButton(
      (bool, int) config, TextEditingController textController) {
    final bool add = config.$1;
    final int num = config.$2;

    return Builder(builder: (context) {
      return TDButton(
          text: "${add ? '+' : '-'}$num",
          height: 70.h,
          size: TDButtonSize.small,
          theme: TDButtonTheme.primary,
          onTap: () => _handleButtonTap(add, num, textController));
    }).padding(horizontal: 10.w);
  }

  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();

    return Column(mainAxisSize: MainAxisSize.min, children: [
      Row(children: [
        TDText(title),
        sb(15.w),
        BaseIntegerInputWidget(
            textC: textC,
            focusNode: focusNode,
            min: min,
            max: max,
            inputWidth: inputWidth,
            inputHeight: inputHeight),
        sb(15.w),
        _buildAdjustmentButtonsRow(textC).hide(isVisible: !showMoreAdjustment)
      ]),
      sb(0, 30.h),
      _buildAdjustmentButtonsRow(textC).hide(isVisible: showMoreAdjustment)
    ]);
  }
}
