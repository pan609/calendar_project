import 'package:calendar_project/calendar/business/models/event_item_model.dart';
import 'package:flutter/foundation.dart';

class EventListModel extends ChangeNotifier {
  List<EventItemModel> items = [EventItemModel(id:1),EventItemModel(id:2)];

  void addItem(EventItemModel item) {
    items.add(item);
    notifyListeners(); // 通知监听器数据已更改
  }
}