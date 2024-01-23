import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      theme: ThemeData(
        primaryColor: Colors.red,
        scaffoldBackgroundColor: Color(0xFFEBE5D9),
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFEBE5D9)),
        useMaterial3: true,
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
