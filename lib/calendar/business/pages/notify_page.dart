import 'package:flutter/material.dart';

class NotifyPage extends StatelessWidget {
  final String? title;
  const NotifyPage({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Notify'),
    );
  }
}