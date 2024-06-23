import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  final String? title;
  const CalendarPage({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('calendar'),
    );
  }
}