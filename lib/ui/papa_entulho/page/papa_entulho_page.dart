import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:papa_entulho/domain/routes/routes.dart';
import 'package:papa_entulho/domain/widgets/app_button_primary.dart';
import 'package:papa_entulho/domain/widgets/papa_entulho_card.dart';
import 'package:papa_entulho/ui/papa_entulho/controller/papa_entulho_controller.dart';

class PapaEntulhoPage extends GetView<PapaEntulhoController> {
  const PapaEntulhoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: controller.obx(
              (state) => ListView.builder(
                itemCount: state?.length,
                itemBuilder: (context, index) {
                  final item = state![index];
                  return PapaEntulhoCard(
                    papaEntulho: item,
                    onEdit: () {
                      Get.toNamed(Routes.PAPA_ENTULHO_FORM, arguments: item);
                    },
                    onDelete: () {
                      controller.deletePapaEntulho(item.id!);
                    },
                  );
                },
              ),
              onLoading: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(child: CircularProgressIndicator()),
              ),
              onEmpty: const Column(
                children: [
                  SizedBox(height: 100),
                  Text('Nenhum papa entulho cadastrado'),
                  SizedBox(height: 100),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  AppButtonPrimary(
                    onTap: () {
                      controller.clearForm();
                      Get.toNamed(Routes.PAPA_ENTULHO_FORM);
                    },
                    labelText: 'Cadastrar Papa Entulho',
                    margin: 32,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
