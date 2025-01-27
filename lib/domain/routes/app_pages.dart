import 'package:get/get.dart';
import 'package:papa_entulho/domain/bindings/home_binding.dart';
import 'package:papa_entulho/domain/bindings/login_binding.dart';
import 'package:papa_entulho/domain/bindings/register_binding.dart';
import 'package:papa_entulho/domain/middleware/auth_middleware.dart';
import 'package:papa_entulho/domain/routes/routes.dart';
import 'package:papa_entulho/ui/auth/page/login_page.dart';
import 'package:papa_entulho/ui/auth/page/register_page.dart';
import 'package:papa_entulho/ui/home/page/home_page.dart';

class AppPages {
  static final pages = [
    //home
    GetPage(
      name: Routes.HOME,
      middlewares: [
        AuthMiddleware(),
      ],
      binding: HomeBinding(),
      page: () => const HomePage(),
    ),
    //login
    GetPage(
      name: Routes.LOGIN,
      binding: LoginBinding(),
      page: () => const LoginPage(),
    ),
    //register
    GetPage(
      name: Routes.REGISTER,
      binding: RegisterBinding(),
      page: () => const RegisterPage(),
    ),
  ];
}
