import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:papa_entulho/ui/home/controller/perfil_controller.dart';

class PerfilPage extends GetView<PerfilController> {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) {
        if (state == null) {
          return const Center(child: CircularProgressIndicator());
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Name: ${state.name}'),
              Text('Phone: ${state.phone}'),
              Text('Email: ${state.email}'),
            ],
          ),
        );
      },
      onLoading: const Center(child: LoadingIndicator(indicatorType: Indicator.triangleSkewSpin)),
      onError: (error) => Center(child: Text('Error: $error')),
    );
  }
}
