import 'package:get/get.dart';
import 'package:papa_entulho/domain/repositories/papa_entulho_repository.dart';
import 'package:papa_entulho/ui/papa_entulho/controller/papa_entulho_controller.dart';

class PapaEntulhoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PapaEntulhoController());
    Get.lazyPut(() => PapaEntulhoRepository());
  }
}
