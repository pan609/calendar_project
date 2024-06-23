import 'package:calendar_project/calendar/business/models/common_button_model.dart';

class SelectButtonModel extends CommonButtonModel {
  bool isSelected;

  SelectButtonModel({
    required this.isSelected,
    required super.content,
    super.buttonId,
  });
}
