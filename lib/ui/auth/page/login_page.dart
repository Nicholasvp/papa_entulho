import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:papa_entulho/domain/routes/routes.dart';
import 'package:papa_entulho/domain/widgets/app_button_primary.dart';
import 'package:papa_entulho/ui/auth/controller/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: Container(
          width: (Get.width * 0.5) + 100,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                autofillHints: const [AutofillHints.email],
                controller: controller.emailController,
              ),
              const SizedBox(height: 16),
              TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
                autofillHints: const [AutofillHints.password],
                controller: controller.passwordController,
              ),
              const SizedBox(height: 16),
              controller.obx(
                (state) => AppButtonPrimary(
                  onTap: controller.login,
                  labelText: 'Entrar',
                  expanded: true,
                ),
                onLoading: const AppButtonPrimary(
                  isLoading: true,
                  labelText: 'Entrar',
                  expanded: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
