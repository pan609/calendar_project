import 'package:calendar_project/calendar/business/bindings/add_event_binding.dart';
import 'package:calendar_project/calendar/business/bindings/home_binding.dart';
import 'package:calendar_project/calendar/business/pages/add_event_page.dart';
import 'package:calendar_project/calendar/business/pages/home_page.dart';
import 'package:calendar_project/calendar/common/constants/page_name.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> routes = [
    GetPage(
      name: PageName.homePage,
      page: () => const HomePage(),
      binding:HomeBinding(),
    ),
    GetPage(
      name: PageName.addEventPage,
      page: () =>  AddEventPage(),
      binding: AddEventBinding(),
    ),
  ];
}