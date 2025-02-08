import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:papa_entulho/domain/routes/routes.dart';
import 'package:papa_entulho/domain/widgets/app_button_primary.dart';
import 'package:papa_entulho/domain/widgets/app_text_field.dart';
import 'package:papa_entulho/ui/papa_entulho/controller/papa_entulho_controller.dart';

class PapaEntulhoForm extends StatefulWidget {
  const PapaEntulhoForm({super.key});

  @override
  State<PapaEntulhoForm> createState() => _PapaEntulhoFormState();
}

class _PapaEntulhoFormState extends State<PapaEntulhoForm> {
  final controller = Get.find<PapaEntulhoController>();
  final TextEditingController dateRangeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (Get.arguments != null) {
      controller.fillForm();
      _updateDateRangeField();
    }
  }

  void _updateDateRangeField() {
    if (controller.dateInitialController.text.isNotEmpty && controller.dateFinalController.text.isNotEmpty) {
      dateRangeController.text = "${controller.dateInitialController.text} - ${controller.dateFinalController.text}";
    }
  }

  @override
  Widget build(BuildContext context) {
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

              // Date Range Picker
              GestureDetector(
                onTap: () async {
                  DateTimeRange? pickedRange = await showDateRangePicker(
                    saveText: 'Salvar',
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                    initialDateRange:
                        (controller.dateInitialController.text.isNotEmpty && controller.dateFinalController.text.isNotEmpty)
                            ? DateTimeRange(
                                start: DateFormat('dd/MM/yy').parse(controller.dateInitialController.text),
                                end: DateFormat('dd/MM/yy').parse(controller.dateFinalController.text),
                              )
                            : null,
                  );

                  if (pickedRange != null) {
                    setState(() {
                      controller.dateInitialController.text = DateFormat('dd/MM/yy').format(pickedRange.start);
                      controller.dateFinalController.text = DateFormat('dd/MM/yy').format(pickedRange.end);
                      _updateDateRangeField();
                    });
                  }
                },
                child: AbsorbPointer(
                  child: AppTextField(
                    labelText: 'Período (Data Inicial - Data Final)',
                    controller: dateRangeController,
                    icon: Icons.date_range,
                    required: true,
                  ),
                ),
              ),

              const SizedBox(height: 10),
              AppTextField(
                labelText: 'Quantidade',
                controller: controller.quantityController,
                required: true,
                numeric: true,
                icon: Icons.format_list_numbered,
              ),
              const SizedBox(height: 20),
              GetBuilder<PapaEntulhoController>(
                init: PapaEntulhoController(),
                builder: (_) {
                  return AppButtonPrimary(
                    onTap: () {
                      if (controller.formKey.currentState!.validate()) {
                        if (Get.arguments == null) {
                          controller.createPapaEntulho();
                        } else {
                          controller.updatePapaEntulho(Get.arguments.id);
                        }
                      }
                    },
                    isLoading: controller.status.isLoading,
                    labelText: Get.arguments == null ? 'Criar' : 'Atualizar',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
