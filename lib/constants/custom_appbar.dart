import 'package:flutter/material.dart';
import 'package:intern_project/constants/custom_textstyles.dart';

class CustomAppbar {
  appbar(String title) {
    return AppBar(
      title: Text(
        title,
        style: CustomTextStyles().appbarTextStyle,
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
    );
  }
}
