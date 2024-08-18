
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String? title;
  const HomePage({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('homepage'),
    );
  }
}