import 'package:get/get.dart';
import 'package:papa_entulho/ui/home/controller/perfil_controller.dart';

class PerfilBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PerfilController());
  }
}
