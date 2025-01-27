import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:papa_entulho/domain/repositories/export_repositories.dart';
import 'package:papa_entulho/domain/routes/routes.dart';

class RegisterController extends GetxController with StateMixin {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();
  final nameController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final _authRepository = Get.find<AuthRepository>();

  void register() async {
    if (!formKey.currentState!.validate()) return;
    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar('Erro', 'As senhas não conferem');
      return;
    }

    if (!emailController.text.isEmail) {
      Get.snackbar('Erro', 'Email inválido');
      return;
    }

    change(null, status: RxStatus.loading());

    final user = await _authRepository.register(
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
      phone: phoneController.text,
    );

    if (user != null) {
      change(null, status: RxStatus.success());
      Get.offAllNamed(Routes.HOME);
    } else {
      change(null, status: RxStatus.error('Erro ao cadastrar'));
      Get.snackbar('Problema', 'Erro ao cadastrar');
    }
  }
}
