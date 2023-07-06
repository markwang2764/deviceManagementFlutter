import 'package:flutter/material.dart';

class TabBarItem {
  final String title;
  final Icon norIcon;
  final Icon acIcon;
  TabBarItem(
      {required this.title, required this.norIcon, required this.acIcon});
}

class TabInfosItem {
  final String name;
  final int index;
  bool selected;
  TabInfosItem(
      {required this.name, required this.selected, required this.index});
}
