import 'package:get/get.dart';
import 'package:papa_entulho/domain/bindings/home_binding.dart';
import 'package:papa_entulho/domain/bindings/login_binding.dart';
import 'package:papa_entulho/domain/bindings/papa_entulho_binding.dart';
import 'package:papa_entulho/domain/bindings/perfil_binding.dart';
import 'package:papa_entulho/domain/bindings/register_binding.dart';
import 'package:papa_entulho/domain/middleware/auth_middleware.dart';
import 'package:papa_entulho/domain/routes/routes.dart';
import 'package:papa_entulho/ui/auth/page/login_page.dart';
import 'package:papa_entulho/ui/auth/page/register_page.dart';
import 'package:papa_entulho/ui/home/pages/home_page.dart';
import 'package:papa_entulho/ui/papa_entulho/page/papa_entulho_form.dart';

class AppPages {
  static final pages = [
    //home
    GetPage(
      name: Paths.HOME,
      middlewares: [
        AuthMiddleware(),
      ],
      bindings: [
        HomeBinding(),
        PapaEntulhoBinding(),
        PerfilBinding(),
      ],
      page: () => const HomePage(),
      children: [
        GetPage(
          name: Paths.PAPA_ENTULHO_FORM,
          bindings: [
            PapaEntulhoBinding(),
          ],
          page: () => const PapaEntulhoForm(),
        ),
      ],
    ),
    //login
    GetPage(
      name: Paths.LOGIN,
      binding: LoginBinding(),
      page: () => const LoginPage(),
    ),
    //register
    GetPage(
      name: Paths.REGISTER,
      binding: RegisterBinding(),
      page: () => const RegisterPage(),
    ),
  ];
}
