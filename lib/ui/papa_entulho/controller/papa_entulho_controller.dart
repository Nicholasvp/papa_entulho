import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:papa_entulho/domain/models/papa_entulho_model.dart';
import 'package:papa_entulho/domain/repositories/papa_entulho_repository.dart';
import 'package:papa_entulho/domain/routes/routes.dart';
import 'package:papa_entulho/domain/utils/notifications_utils.dart';

class PapaEntulhoController extends GetxController with StateMixin<List<PapaEntulhoModel>> {
  final _papaEntulhoRepository = Get.find<PapaEntulhoRepository>();

  final formKey = GlobalKey<FormState>();
  final descriptionController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final dateInitialController = TextEditingController();
  final dateFinalController = TextEditingController();
  final quantityController = TextEditingController();
  final statusController = TextEditingController();

  @override
  void onReady() {
    getPapaEntulhos();
    super.onReady();
  }

  PapaEntulhoModel get papaEntulhoModelMounted => PapaEntulhoModel(
        id: Get.arguments?.id,
        description: descriptionController.text,
        address: addressController.text,
        phone: phoneController.text,
        dateInitial: DateFormat('dd/MM/yy').parse(dateInitialController.text),
        dateFinal: DateFormat('dd/MM/yy').parse(dateFinalController.text),
        quantity: int.parse(quantityController.text),
      );

  void createPapaEntulho() async {
    change(null, status: RxStatus.loading());
    try {
      await _papaEntulhoRepository.createPapaEntulho(papaEntulhoModelMounted);
      getPapaEntulhos();
      Get.offAndToNamed(Routes.HOME);
      showSucces('Papa Entulho criado com sucesso');
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
      showError(e.toString());
    }
  }

  Future<void> getPapaEntulhos() async {
    change(null, status: RxStatus.loading());
    try {
      final response = await _papaEntulhoRepository.getPapaEntulhos();

      if (response.isEmpty) {
        change(null, status: RxStatus.empty());
        return;
      }

      change(response, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
      showError(e.toString());
    }
  }

  void deletePapaEntulho(String id) async {
    bool confim = await confirmModal();
    if (!confim) return;

    change(null, status: RxStatus.loading());
    try {
      await _papaEntulhoRepository.deletePapaEntulho(id);
      await getPapaEntulhos();
      showSucces('Papa Entulho deletado com sucesso');
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void updatePapaEntulho(String id) async {
    change(null, status: RxStatus.loading());
    try {
      await _papaEntulhoRepository.updatePapaEntulho(id, papaEntulhoModelMounted);
      getPapaEntulhos();
      Get.offAndToNamed(Routes.HOME);
      showSucces('Papa Entulho atualizado com sucesso');
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void searchPapaEntulho(String search) async {
    if (search.isEmpty) {
      getPapaEntulhos();
      return;
    }
    change(null, status: RxStatus.loading());
    try {
      final response = await _papaEntulhoRepository.searchPapaEntulho(search: search, field: 'description');

      if (response.isEmpty) {
        change(null, status: RxStatus.empty());
        return;
      }

      change(response, status: RxStatus.success());
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
    descriptionController.text = papaEntulhoModel.description;
    addressController.text = papaEntulhoModel.address;
    phoneController.text = papaEntulhoModel.phone;
    dateInitialController.text = DateFormat('dd/MM/yy').format(papaEntulhoModel.dateInitial);
    dateFinalController.text = DateFormat('dd/MM/yy').format(papaEntulhoModel.dateFinal);
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

  String daysRemaining(DateTime date) {
    final difference = date.difference(DateTime.now());
    return '${difference.inDays} DIAS RESTANTES';
  }

  String daysForStart(DateTime date) {
    final today = DateTime.now();
    final difference = date.difference(DateTime(today.year, today.month, today.day));
    return '${difference.inDays} DIAS PARA INÍCIO';
  }
}
