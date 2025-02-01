import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:papa_entulho/domain/routes/routes.dart';
import 'package:papa_entulho/domain/widgets/app_button_primary.dart';
import 'package:papa_entulho/domain/widgets/app_text_field.dart';
import 'package:papa_entulho/ui/papa_entulho/controller/papa_entulho_controller.dart';

class PapaEntulhoForm extends StatelessWidget {
  const PapaEntulhoForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PapaEntulhoController>();
    if (Get.arguments != null) {
      controller.fillForm();
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.offNamed(Routes.HOME),
        ),
        title: const Text('Criar Papa Entulho'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              AppTextField(labelText: 'Descrição', controller: controller.descriptionController),
              const SizedBox(height: 10),
              AppTextField(labelText: 'Endereço', controller: controller.addressController),
              const SizedBox(height: 10),
              AppTextField(labelText: 'Telefone', controller: controller.phoneController),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        if (pickedDate != null) {
                          controller.dateInitialController.text = pickedDate.toString().split(' ')[0];
                        }
                      },
                      child: AbsorbPointer(
                        child: AppTextField(
                          labelText: 'Data Inicial',
                          controller: controller.dateInitialController,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        if (pickedDate != null) {
                          controller.dateFinalController.text = pickedDate.toString().split(' ')[0];
                        }
                      },
                      child: AbsorbPointer(
                        child: AppTextField(
                          labelText: 'Data Final',
                          controller: controller.dateFinalController,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              AppTextField(labelText: 'Quantidade', controller: controller.quantityController),
              const SizedBox(height: 10),
              const SizedBox(height: 20),
              controller.obx(
                (state) => AppButtonPrimary(
                  onTap: () {
                    if (controller.formKey.currentState!.validate()) {
                      if (Get.arguments == null) {
                        controller.createPapaEntulho();
                      } else {
                        controller.updatePapaEntulho(Get.arguments.id);
                      }
                    }
                  },
                  labelText: Get.arguments == null ? 'Criar' : 'Atualizar',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
