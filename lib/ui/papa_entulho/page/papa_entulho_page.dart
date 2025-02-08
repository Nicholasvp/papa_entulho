import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:papa_entulho/domain/routes/routes.dart';
import 'package:papa_entulho/domain/widgets/app_button_primary.dart';
import 'package:papa_entulho/domain/widgets/app_text_field.dart';
import 'package:papa_entulho/domain/widgets/papa_entulho_card.dart';
import 'package:papa_entulho/ui/papa_entulho/controller/papa_entulho_controller.dart';

class PapaEntulhoPage extends GetView<PapaEntulhoController> {
  const PapaEntulhoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: Row(
              children: [
                Flexible(
                  child: AppTextField(
                    labelText: 'Pesquisar',
                    controller: TextEditingController(),
                    onChanged: (value) {
                      controller.searchPapaEntulho(value);
                    },
                  ),
                ),
                const SizedBox(width: 16),
                AppButtonPrimary(
                  onTap: () {
                    controller.clearForm();
                    Get.toNamed(Routes.PAPA_ENTULHO_FORM);
                  },
                  borderColor: Colors.white,
                  labelText: 'Criar Novo',
                ),
              ],
            ),
          ),
          Expanded(
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
                padding: EdgeInsets.all(100),
                child: Center(
                    child: LoadingIndicator(
                  indicatorType: Indicator.ballTrianglePath,
                  colors: [Colors.orange],
                )),
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
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
