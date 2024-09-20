enum Category { sport, relax, work, eating, customized }

enum FinishState { todo, pending, completed }

class EventItemModel {
  int id;
  String? title;
  Category? category;
  FinishState? state;
  String? description;
  String? date;
  String? startTime;
  String? stopTime;
  bool? repeat;

  EventItemModel(
      {required this.id,
      this.title,
      this.category,
      this.state,
      this.description,
      this.date,
      this.startTime,
      this.stopTime,
      this.repeat});
}
