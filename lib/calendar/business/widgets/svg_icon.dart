import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIconWidget extends StatelessWidget {
  final String assetName;
  final double? size;
  final Color? color;

  const SvgIconWidget(
      this.assetName, {
        super.key,
        this.size,
        this.color,
      });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      height: size,
      width: size,
      color: color,
    );
  }
}