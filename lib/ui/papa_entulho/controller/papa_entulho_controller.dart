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

  void deletePapaEntulho(String id) async {
    bool confim = await confirmModal();
    if (!confim) return;

    change(null, status: RxStatus.loading());
    try {
      await _papaEntulhoRepository.deletePapaEntulho(id);
      getPapaEntulhos();
      Get.snackbar('Sucesso', 'Papa Entulho deletado com sucesso');
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void updatePapaEntulho(String id) async {
    final description = descriptionController.text;
    final address = addressController.text;
    final phone = phoneController.text;
    final dateInitial = DateTime.parse(dateInitialController.text);
    final dateFinal = DateTime.parse(dateFinalController.text);
    final quantity = int.parse(quantityController.text);

    change(null, status: RxStatus.loading());
    try {
      PapaEntulhoModel papaEntulhoModel = PapaEntulhoModel(
        id: id,
        description: description,
        address: address,
        phone: phone,
        dateInitial: dateInitial,
        dateFinal: dateFinal,
        quantity: quantity,
      );
      await _papaEntulhoRepository.updatePapaEntulho(id, papaEntulhoModel);
      getPapaEntulhos();
      Get.offAndToNamed(Routes.HOME);
      Get.snackbar('Sucesso', 'Papa Entulho atualizado com sucesso');
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future<bool> confirmModal() async {
    bool result = false;
    await Get.defaultDialog(
      title: 'Confirmação',
      middleText: 'Deseja realmente excluir este Papa Entulho?',
      textConfirm: 'Sim',
      textCancel: 'Não',
      onConfirm: () {
        result = true;
        Get.back();
      },
      onCancel: () => result = false,
    );
    return result;
  }

  void fillForm() {
    final papaEntulhoModel = Get.arguments as PapaEntulhoModel;
    descriptionController.text = papaEntulhoModel.description ?? '';
    addressController.text = papaEntulhoModel.address;
    phoneController.text = papaEntulhoModel.phone;
    dateInitialController.text = papaEntulhoModel.dateInitial.toString().split(' ')[0];
    dateFinalController.text = papaEntulhoModel.dateFinal.toString().split(' ')[0];
    quantityController.text = papaEntulhoModel.quantity.toString();
  }

  void clearForm() {
    descriptionController.clear();
    addressController.clear();
    phoneController.clear();
    dateInitialController.clear();
    dateFinalController.clear();
    quantityController.clear();
  }
}
