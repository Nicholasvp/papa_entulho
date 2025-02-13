import 'package:get/get.dart';
import 'package:papa_entulho/domain/repositories/auth_repository.dart';
import 'package:papa_entulho/domain/repositories/papa_entulho_repository.dart';

class PerfilController extends GetxController with StateMixin {
  final authRepository = Get.find<AuthRepository>();
  final papaEntulhoRepository = Get.find<PapaEntulhoRepository>();

  int totalQuantity = 0;

  @override
  void onReady() async {
    await getQuantityPapaEntulhos();
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

  Future<void> getQuantityPapaEntulhos() async {
    totalQuantity = await papaEntulhoRepository.getQuantityPapaEntulhos();
  }
}
