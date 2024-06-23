import 'package:calendar_project/calendar/business/widgets/svg_icon.dart';
import 'package:calendar_project/calendar/common/constants/page_name.dart';
import 'package:calendar_project/calendar/common/constants/svg_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/build_navigation.dart';
import 'calendar_page.dart';
import 'setting_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.title});

  final String? title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController pageController = PageController();
  int currentIndex = 0;

  void onIndexChanged(int index) {
    setState(() {
      currentIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // 扩展到Scaffold的底部
      resizeToAvoidBottomInset: false,
      // 不允许键盘事件影响界面
      appBar: AppBar(
        title: const Text('首页'),
      ),
      // PageController 控制 PageView 呈现页面
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onIndexChanged,
        children: const [
          CalendarPage(title: "calendar"),
          SettingPage(title: "setting"),
        ],
      ),
      // 底部带凹下的导航
      bottomNavigationBar: BuildNavigation(
        currentIndex: currentIndex,
        items: [
          NavigationItemModel(
            label: "calendar",
            icon: SvgPath.calendarIcon,
          ),
          NavigationItemModel(
            label: "setting",
            icon: SvgPath.settingsIcon,
          ),
        ],
        onTap: onIndexChanged, // 切换tab事件
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          Get.toNamed(PageName.addEventPage);
        },
        shape: const CircleBorder(
          side: BorderSide(color: Colors.red),
        ),
        child: const SvgIconWidget(
          SvgPath.addEventIcon,
          size: 250,
        ),
      ),
      // 浮动按钮
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // 浮动按钮 停靠在底部中间位置
    );
  }
}
