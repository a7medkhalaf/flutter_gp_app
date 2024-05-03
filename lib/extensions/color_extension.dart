import 'package:flutter/material.dart';

extension ColorExtension on Color {
  Color stringToColor(String colorString) {
    try {
      return Color(int.parse(colorString));
    } catch (e) {
      print('Invalid color string: $colorString');
      return Colors.black; // Return a default color in case of error
    }
  }
}
