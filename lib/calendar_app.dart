import 'package:calendar_project/calendar/business/pages/home_page.dart';
import 'package:calendar_project/calendar/business/pages/notify_page.dart';
import 'package:calendar_project/calendar/common/constants/svg_path.dart';
import 'package:flutter/material.dart';

import 'calendar/business/widgets/build_navigation.dart';
import 'calendar/business/pages/calendar_page.dart';
import 'calendar/business/pages/setting_page.dart';

class CalendarApp extends StatefulWidget {
  const CalendarApp({super.key, this.title});

  final String? title;

  @override
  State<CalendarApp> createState() => _CalendarAppState();
}

class _CalendarAppState extends State<CalendarApp> {
  final PageController pageController = PageController();
  int currentIndex = 0;

  void onIndexChanged(int index) {
    // print('index:$index');
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
        title: const Text(
          'Hello, Mike~',
          style: TextStyle(
            fontFamily: 'Jaldi', // 字体家族
            fontSize: 32.0, // 字体大小
            fontWeight: FontWeight.w400, // 字体权重，400 对应普通字体
            height: 54.08 / 32.0, // 行高，注意 Flutter 中的 height 是相对于 fontSize 的倍数
          ),
          textAlign: TextAlign.left, // 文本对齐方式
        ),
      ),
      // PageController 控制 PageView 呈现页面
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onIndexChanged,
        children: [
          HomePage(title: "homepage"),
          const CalendarPage(title: "calendar"),
          const NotifyPage(title: "notify"),
          const SettingPage(title: "setting"),
        ],
      ),
      bottomNavigationBar: BuildNavigation(
        currentIndex: currentIndex,
        items: [
          NavigationItemModel(
            icon: SvgPath.homepageIcon,
          ),
          NavigationItemModel(
            icon: SvgPath.calendarIcon,
          ),
          NavigationItemModel(
            icon: SvgPath.notifyIcon,
          ),
          NavigationItemModel(
            icon: SvgPath.profileIcon,
          ),
        ],
        onTap: onIndexChanged, // 切换tab事件
      ),
      // floatingActionButton: FloatingActionButton.large(
      //   onPressed: () {
      //     Get.toNamed(PageName.addEventPage);
      //   },
      //   shape: const CircleBorder(
      //     side: BorderSide(color: Colors.red),
      //   ),
      //   child: const SvgIconWidget(
      //     SvgPath.addEventIcon,
      //     size: 250,
      //   ),
      // ),
      // // 浮动按钮
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // 浮动按钮 停靠在底部中间位置
    );
  }
}
