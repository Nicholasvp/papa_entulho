import 'package:get/get.dart';
import 'package:papa_entulho/ui/auth/controller/register_controller.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}
