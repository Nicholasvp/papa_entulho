import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
              AppTextField(
                labelText: 'Descrição',
                controller: controller.descriptionController,
                required: true,
                icon: Icons.description,
              ),
              const SizedBox(height: 10),
              AppTextField(
                labelText: 'Endereço do cliente',
                controller: controller.addressController,
                required: true,
                icon: Icons.location_on,
              ),
              const SizedBox(height: 10),
              AppTextField(
                labelText: 'Telefone do cliente',
                controller: controller.phoneController,
                required: true,
                icon: Icons.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  TelefoneInputFormatter(),
                ],
              ),
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
                          icon: Icons.calendar_today,
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
                          icon: Icons.calendar_today,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              AppTextField(
                labelText: 'Quantidade',
                controller: controller.quantityController,
                required: true,
                numeric: true,
                icon: Icons.format_list_numbered,
              ),
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
