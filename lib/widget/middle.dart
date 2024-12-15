import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class BaseIntegerInputWidget extends StatelessWidget {
  final int min;
  final int max;
  final double inputWidth;
  final double inputHeight;
  final TextEditingController textC;
  final FocusNode focusNode;

  const BaseIntegerInputWidget({
    super.key,
    required this.textC,
    required this.focusNode,
    this.min = 30,
    this.max = 99,
    this.inputWidth = 300,
    this.inputHeight = 100,
  });

  void _handleFocusChange(TextEditingController textC, FocusNode focusNode) {
    if (!focusNode.hasFocus) {
      final num = int.tryParse(textC.text);
      if (num == null) {
        textC.text = "";
      } else {
        textC.text = num.clamp(min, max).toString();
      }
    }
  }

  Widget _buildInput(BuildContext context, TextEditingController textController,
      FocusNode focusNode) {
    return TextField(
      focusNode: focusNode,
      controller: textController,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: "$min-$max",
          contentPadding: EdgeInsets.only(bottom: 40.h)),
    ).w(inputWidth.w).h(inputHeight.h).color(Vx.white);
  }

  @override
  Widget build(BuildContext context) {
    focusNode.addListener(() => _handleFocusChange(textC, focusNode));

    return _buildInput(context, textC, focusNode);
  }
}
