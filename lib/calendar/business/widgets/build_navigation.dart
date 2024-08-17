import 'package:flutter/material.dart';

import 'svg_icon.dart';

class BuildNavigation extends StatelessWidget {
  final int currentIndex;
  final List<NavigationItemModel> items;
  final Function(int) onTap;

  const BuildNavigation({
    super.key,
    required this.currentIndex,
    required this.items,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var widgets = <Widget>[];
    var theme = Theme.of(context).bottomNavigationBarTheme;
    for (var i = 0; i < items.length; i++) {
      // selected tab icon has different style and color
      // var labelStyle = currentIndex == i ? theme.selectedLabelStyle : theme.unselectedLabelStyle;
      // delete center add button gap
      // var gap = (items.length / 2).ceil();
      // if (gap == i) widgets.add(const SizedBox(width: 160));
      widgets.add(Expanded(
        child: MaterialButton(
          elevation: 0,
          padding: const EdgeInsets.all(0),
          onPressed: () => onTap(i),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  SvgIconWidget(
                    items[i].icon,
                    size: 30,
                    color: currentIndex == i ? const Color(0xFF302CF3) : null, // todo: selected inco filled style
                  ),
                ],
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ));
    }
    return BottomAppBar(
      color: theme.backgroundColor,
      child: SizedBox(
        height: kBottomNavigationBarHeight,
        child: Row(children: widgets),
      ),
    );
  }
}

class NavigationItemModel {
  final String icon;
  final int count;

  NavigationItemModel({
    required this.icon,
    this.count = 0,
  });
}
