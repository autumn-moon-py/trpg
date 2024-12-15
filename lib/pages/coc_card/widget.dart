import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import 'package:trpg_tool/widget/small.dart';

Widget cardBG({required String title, required Widget child}) {
  return Column(mainAxisSize: MainAxisSize.min, children: [
    TDText(title, fontWeight: FontWeight.bold),
    const Divider(),
    sb(0, 20.h),
    child
  ]);
}
