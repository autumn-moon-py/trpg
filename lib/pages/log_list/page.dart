import 'package:flutter/material.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import 'package:trpg_tool/common/global.dart';

class LogListPage extends StatefulWidget {
  const LogListPage({super.key});

  @override
  State<LogListPage> createState() => _LogListPageState();
}

class _LogListPageState extends State<LogListPage> {
  final logList = Global.log.logList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: PageView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: logList.length,
            itemBuilder: (c, i) {
              final text = logList[i];
              return TDText(text);
            }));
  }
}
