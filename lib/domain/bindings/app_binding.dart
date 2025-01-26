import 'package:get/get.dart';
import 'package:papa_entulho/domain/repositories/auth_repository.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      AuthRepository(),
    );
  }
}
