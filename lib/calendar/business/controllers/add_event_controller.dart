import 'package:calendar_project/calendar/business/models/select_button_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class AddEventController extends GetxController {
  late List<SelectButtonModel> categoryButtonList = [];
  Object categoryId = 'categoryId';
  Rx<DateTime> startDateTime = DateTime.now().obs;
  Rx<DateTime> endDateTime = DateTime.now().obs;
  RxString startDateTimeText = ''.obs;
  RxString endDateTimeText = ''.obs;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  void initData() {
    print('initData');
    categoryButtonList.add(SelectButtonModel(content: 'sports', buttonId: 1, isSelected: false));
    categoryButtonList.add(SelectButtonModel(content: 'study', buttonId: 2, isSelected: false));
    categoryButtonList.add(SelectButtonModel(content: 'work', buttonId: 3, isSelected: false));
    categoryButtonList.add(SelectButtonModel(content: 'custom', buttonId: 4, isSelected: false));
    setTime(startDateTime.value, 1);
    setTime(endDateTime.value, 2);
  }

  void selectButton(int id) {
    for (SelectButtonModel model in categoryButtonList) {
      if (model.buttonId == id) {
        model.isSelected = !model.isSelected;
        update([categoryId]);
      }
    }
  }

  // 日期选择
  Future<void> selectDate(BuildContext context, int id) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: id == 1 ? startDateTime.value : endDateTime.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (id == 1) {
      startDateTime.value = picked ?? DateTime.now();
    } else {
      endDateTime.value = picked ?? DateTime.now();
    }
    selectTime(context, id);
  }

  // 时间选择
  Future<void> selectTime(BuildContext context, int id) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(
        id == 1 ? startDateTime.value : endDateTime.value,
      ),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child ?? const Text(''),
        );
      },
    );
    if (id == 1) {
      startDateTime.value = DateTime(startDateTime.value.year, startDateTime.value.month, startDateTime.value.day,
          pickedTime?.hour ?? 0, pickedTime?.minute ?? 0);
      setTime(startDateTime.value, id);
    } else {
      endDateTime.value = DateTime(endDateTime.value.year, endDateTime.value.month, endDateTime.value.day,
          pickedTime?.hour ?? 0, pickedTime?.minute ?? 0);
      setTime(endDateTime.value, id);
    }
  }

  String formatTime(int time) {
    if (time < 0) return '00';
    if (time < 10) {
      return '0$time';
    } else {
      return '$time';
    }
  }

  void setTime(DateTime dateTime, id) {
    if (id == 1) {
      startDateTimeText.value =
          '${dateTime.month}-${dateTime.day} ${formatTime(dateTime.hour)}:${formatTime(dateTime.minute)}';
    } else {
      endDateTimeText.value =
          '${dateTime.month}-${dateTime.day} ${formatTime(dateTime.hour)}:${formatTime(dateTime.minute)}';
    }
  }
}
