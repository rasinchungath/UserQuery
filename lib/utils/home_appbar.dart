import 'package:flutter/material.dart';

import '../constants/constants.dart';

AppBar homeAppBar (String title){
  return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 100,
      flexibleSpace: Container(
        height: 100,
        color: kPrimaryColor,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: kWhiteBGColor,
            ),
          ),
        ),
      ),
      );
} 