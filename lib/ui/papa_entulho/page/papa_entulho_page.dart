import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:papa_entulho/domain/routes/routes.dart';
import 'package:papa_entulho/domain/widgets/app_button_primary.dart';
import 'package:papa_entulho/ui/papa_entulho/controller/papa_entulho_controller.dart';

class PapaEntulhoPage extends GetView<PapaEntulhoController> {
  const PapaEntulhoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          controller.obx(
            (state) => Expanded(
              child: ListView.builder(
                itemCount: state?.length,
                itemBuilder: (context, index) {
                  final item = state![index];
                  return InkWell(
                    onTap: () {
                      Get.toNamed(Routes.PAPA_ENTULHO_FORM, arguments: item);
                    },
                    child: ListTile(
                      title: Text(item.description ?? ''),
                      subtitle: Text(item.address),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              Get.toNamed(Routes.PAPA_ENTULHO_FORM, arguments: item);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              controller.deletePapaEntulho(item.id!);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          AppButtonPrimary(
            onTap: () {
              controller.clearForm();
              Get.toNamed(Routes.PAPA_ENTULHO_FORM);
            },
            labelText: 'Cadastrar Papa Entulho',
            margin: 32,
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
