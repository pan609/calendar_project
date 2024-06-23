import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  final String? title;
  const SettingPage({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('setting'),
    );
  }
}