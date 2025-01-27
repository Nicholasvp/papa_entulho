import 'package:get/get.dart';
import 'package:papa_entulho/ui/auth/controller/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
