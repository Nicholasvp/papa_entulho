import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:papa_entulho/domain/repositories/auth_repository.dart';
import 'package:papa_entulho/domain/routes/routes.dart';

class LoginController extends GetxController with StateMixin {
  final emailController = TextEditingController();
  get email => emailController.text;

  final passwordController = TextEditingController();
  get password => passwordController.text;

  final AuthRepository _authRepository = Get.find<AuthRepository>();

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.success());
  }

  void login() async {
    change(null, status: RxStatus.loading());

    final user = await _authRepository.login(email: email, password: password);
    if (user != null) {
      Get.offAllNamed(Routes.HOME);
    }
    change(null, status: RxStatus.success());
  }
}
