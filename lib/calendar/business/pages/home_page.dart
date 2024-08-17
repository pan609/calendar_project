import 'package:calendar_project/calendar/business/pages/notify_page.dart';
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
        title: const Text('首页'),
      ),
      // PageController 控制 PageView 呈现页面
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onIndexChanged,
        children: const [
          // HomePage(title: "homepage"),
          CalendarPage(title: "calendar"),
          NotifyPage(title: "notify"),
          SettingPage(title: "setting"),
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
