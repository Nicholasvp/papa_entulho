import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:papa_entulho/ui/papa_entulho/controller/papa_entulho_controller.dart';

class PapaEntulhoForm extends StatelessWidget {
  const PapaEntulhoForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PapaEntulhoController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Papa Entulho'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.nameController,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: controller.descriptionController,
                decoration: const InputDecoration(labelText: 'Descrição'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a descrição';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (controller.formKey.currentState!.validate()) {
                    controller.createPapaEntulho();
                  }
                },
                child: const Text('Criar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
