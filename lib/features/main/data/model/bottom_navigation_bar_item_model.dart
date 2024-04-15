import 'package:flutter/material.dart';

class BottomNavigationBarItemModel {
  final Image image;
  final Image activeImage;
  final String text;
  BottomNavigationBarItemModel({
    required this.image,
    required this.activeImage,
    required this.text,
  });
}
