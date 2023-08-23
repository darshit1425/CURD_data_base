import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'scrren/home_screen/view/home_scrren.dart';
import 'scrren/read_screen/read_screen.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => Home_Screen(),
        ),
        GetPage(
          name: '/read',
          page: () => Read_Screen(),
        ),
      ],
    ),
  );
}
