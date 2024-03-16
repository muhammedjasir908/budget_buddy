import 'package:flutter/material.dart';

class DotNavigationBarItem{

  final Widget icon;
  final Color? selectedColor;
  final Color? unselectedColor;

  DotNavigationBarItem({
   required this.icon,
   this.selectedColor,
   this.unselectedColor
});
}