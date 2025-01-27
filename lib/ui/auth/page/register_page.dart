import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:papa_entulho/domain/widgets/app_button_primary.dart';
import 'package:papa_entulho/domain/widgets/app_text_field.dart';
import 'package:papa_entulho/ui/auth/controller/register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextField(
                labelText: 'Nome',
                controller: controller.nameController,
              ),
              const SizedBox(height: 16.0),
              AppTextField(
                labelText: 'Email',
                controller: controller.emailController,
              ),
              const SizedBox(height: 16.0),
              AppTextField(
                labelText: 'Telefone',
                controller: controller.phoneController,
              ),
              const SizedBox(height: 16.0),
              AppTextField(
                labelText: 'Senha',
                controller: controller.passwordController,
              ),
              const SizedBox(height: 16.0),
              AppTextField(
                labelText: 'Confirmar Senha',
                controller: controller.confirmPasswordController,
              ),
              const SizedBox(height: 16.0),
              AppButtonPrimary(
                onTap: controller.register,
                labelText: 'Registrar',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
