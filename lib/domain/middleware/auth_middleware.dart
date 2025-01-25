import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:papa_entulho/domain/repositories/auth_repository.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final authRepository = Get.find<AuthRepository>();

    // Se o usuário não estiver logado, redirecione para a página de login
    if (!authRepository.isLoggedIn) {
      return const RouteSettings(name: '/login');
    }

    // Caso contrário, permite o acesso
    return null;
  }
}
