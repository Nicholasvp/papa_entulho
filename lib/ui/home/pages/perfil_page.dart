import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:papa_entulho/ui/home/controller/perfil_controller.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  final controller = Get.find<PerfilController>();

  @override
  void initState() {
    controller.onReady();
    super.initState();
  }

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
              Text('Total de PapaEntulhos Alugados: ${controller.totalQuantity}'),
            ],
          ),
        );
      },
      onLoading: const Center(child: LoadingIndicator(indicatorType: Indicator.triangleSkewSpin)),
      onError: (error) => Center(child: Text('Error: $error')),
    );
  }
}
