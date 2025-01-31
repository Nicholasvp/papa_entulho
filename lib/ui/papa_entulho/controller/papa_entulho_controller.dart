import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:papa_entulho/domain/models/papa_entulho_model.dart';
import 'package:papa_entulho/domain/repositories/papa_entulho_repository.dart';
import 'package:papa_entulho/domain/routes/routes.dart';

class PapaEntulhoController extends GetxController with StateMixin<List<PapaEntulhoModel>> {
  final _papaEntulhoRepository = Get.find<PapaEntulhoRepository>();

  final formKey = GlobalKey<FormState>();
  final descriptionController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final dateInitialController = TextEditingController();
  final dateFinalController = TextEditingController();
  final quantityController = TextEditingController();

  @override
  void onReady() {
    getPapaEntulhos();
    super.onReady();
  }

  void createPapaEntulho() async {
    final description = descriptionController.text;
    final address = addressController.text;
    final phone = phoneController.text;
    final dateInitial = DateTime.parse(dateInitialController.text);
    final dateFinal = DateTime.parse(dateFinalController.text);
    final quantity = int.parse(quantityController.text);

    change(null, status: RxStatus.loading());
    try {
      await _papaEntulhoRepository.createPapaEntulho(description, address, phone, dateInitial, dateFinal, quantity);
      getPapaEntulhos();
      Get.offAndToNamed(Routes.HOME);
      Get.snackbar('Sucesso', 'Papa Entulho criado com sucesso');
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void getPapaEntulhos() async {
    change(null, status: RxStatus.loading());
    try {
      final response = await _papaEntulhoRepository.getPapaEntulhos();
      change(response, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
