import 'package:flutter/material.dart';

class SubCategory {
  final String title;
  final String imageUrl;
  final Function onTapped;

  SubCategory({
    @required this.title,
    @required this.imageUrl,
    @required this.onTapped,
  });
}
