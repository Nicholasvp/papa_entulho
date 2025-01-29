import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:papa_entulho/domain/routes/routes.dart';
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
                  return ListTile(
                    title: Text(item.description ?? ''),
                    subtitle: Text(item.address),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        // controller.deletePapaEntulho(item.id);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          TextButton(
            onPressed: () => Get.toNamed(Routes.PAPA_ENTULHO_FORM),
            child: const Text('Cadastrar Papa Entulho'),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
