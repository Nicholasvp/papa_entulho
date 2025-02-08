import 'package:get/get.dart';
import 'package:papa_entulho/domain/repositories/auth_repository.dart';

class PerfilController extends GetxController with StateMixin {
  PerfilController();

  final authRepository = Get.find<AuthRepository>();

  @override
  void onReady() async {
    await getUser();
    super.onReady();
  }

  Future<void> getUser() async {
    change(null, status: RxStatus.loading());
    try {
      await authRepository.getUser();
      change(authRepository.currentUser, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
