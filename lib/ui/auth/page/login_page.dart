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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              controller: controller.emailController,
            ),
            const SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
              ),
              controller: controller.passwordController,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                controller.obx(
                  (state) => AppButtonPrimary(
                    onTap: controller.login,
                    labelText: 'Entrar',
                  ),
                  onLoading: const AppButtonPrimary(
                    isLoading: true,
                    labelText: 'Entrar',
                  ),
                ),
                AppButtonPrimary(
                  onTap: () {
                    Get.toNamed(Routes.REGISTER);
                  },
                  labelText: 'Cadastro',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
