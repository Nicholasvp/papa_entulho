import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:papa_entulho/domain/models/export_models.dart';
import 'package:papa_entulho/domain/repositories/papa_entulho_repository.dart';

class PapaEntulhoController extends GetxController with StateMixin<PapaEntulhoModel> {
  final _papaEntulhoRepository = Get.find<PapaEntulhoRepository>();

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final dateInitialController = TextEditingController();
  final dateFinalController = TextEditingController();
  final quantityController = TextEditingController();

  void createPapaEntulho() async {
    final description = descriptionController.text;
    final address = addressController.text;
    final phone = phoneController.text;
    final dateInitial = DateTime.parse(dateInitialController.text);
    final dateFinal = DateTime.parse(dateFinalController.text);
    final quantity = int.parse(quantityController.text);

    change(null, status: RxStatus.loading());
    try {
      final response =
          await _papaEntulhoRepository.createPapaEntulho(description, address, phone, dateInitial, dateFinal, quantity);
      change(response, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
