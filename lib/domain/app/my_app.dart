import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:papa_entulho/domain/bindings/app_binding.dart';
import 'package:papa_entulho/domain/routes/app_pages.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Papa Entulho',
      theme: Get.theme,
      initialBinding: AppBinding(),
      getPages: AppPages.pages,
    );
  }
}
