import 'package:get/get.dart';
import 'package:papa_entulho/domain/repositories/export_repositories.dart';

class HomeController extends GetxController {
  final _authRepository = Get.find<AuthRepository>();
  void logout() {
    _authRepository.logout();
  }
}
