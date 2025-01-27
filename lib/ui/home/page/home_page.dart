import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:papa_entulho/ui/home/controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
          child: InkWell(
        onTap: controller.logout,
        child: const Text('sair'),
      )),
    );
  }
}
