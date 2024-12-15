import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import 'package:trpg_tool/pages/coc_card/logic.dart';
import 'package:trpg_tool/pages/coc_card/page1.dart';
import 'package:trpg_tool/pages/coc_card/page2.dart';
import 'package:trpg_tool/pages/coc_card/sub_page/career/page.dart';
import 'package:trpg_tool/widget/extension_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late PageController pageC;
  final pages = ["测试", "车卡"];

  @override
  void initState() {
    final cocCardC = Get.find<CocCardLogic>();
    pageC = cocCardC.pageC;
    super.initState();
  }

  Widget bottomBar() {
    return TDBottomTabBar(TDBottomTabBarBasicType.text,
        useVerticalDivider: false,
        navigationTabs: List.generate(pages.length, (index) {
          return TDBottomTabBarTabConfig(
              tabText: pages[index], onTap: () => pageC.jumpToPage(index));
        }));
  }

  Widget _buildSteps() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      TDButton(text: "1", onTap: () => pageC.jumpToPage(0)),
      TDButton(text: "2", onTap: () => pageC.jumpToPage(1)),
      TDButton(text: "3", onTap: () => pageC.jumpToPage(2)),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Column(children: [
      PageView(
          controller: pageC,
          physics: const BouncingScrollPhysics(),
          children: const [
            CocCardPage1(),
            CocCardPage2(),
            CareerPage(),
          ]).expanded(),
      _buildSteps()
    ]);
  }
}
