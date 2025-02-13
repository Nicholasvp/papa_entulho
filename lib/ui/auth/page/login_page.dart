import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:papa_entulho/domain/widgets/app_button_primary.dart';
import 'package:papa_entulho/domain/widgets/app_text_field.dart';
import 'package:papa_entulho/ui/auth/controller/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: (Get.width * 0.5) + 100,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: Get.width * 0.5,
              ),
              AppTextField(
                labelText: 'Email',
                controller: controller.emailController,
              ),
              const SizedBox(height: 16),
              AppTextField(
                labelText: 'Senha',
                controller: controller.passwordController,
              ),
              const SizedBox(height: 16),
              controller.obx(
                (state) => AppButtonPrimary(
                  onTap: controller.login,
                  labelText: 'Entrar',
                  expanded: true,
                  backgroundColor: Colors.orange,
                  margin: 0,
                ),
                onLoading: const AppButtonPrimary(
                  isLoading: true,
                  labelText: 'Entrar',
                  backgroundColor: Colors.orange,
                  expanded: true,
                  margin: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
