import 'package:flutter/material.dart';
import 'package:get/get.dart';

PreferredSizeWidget myAppBar(String headingText) {
  return AppBar(
    title: Text(headingText),
    backgroundColor: Colors.transparent,
    actions: [
      IconButton(
          onPressed: () {
            Get.toNamed('/search');
          },
          icon: Icon(Icons.search))
    ],
  );
}
