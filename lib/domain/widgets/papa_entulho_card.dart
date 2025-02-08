import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:papa_entulho/domain/enums/enums.dart';
import 'package:papa_entulho/domain/models/papa_entulho_model.dart';
import 'package:papa_entulho/domain/utils/notifications_utils.dart';
import 'package:papa_entulho/ui/papa_entulho/controller/papa_entulho_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class PapaEntulhoCard extends StatelessWidget {
  final PapaEntulhoModel papaEntulho;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const PapaEntulhoCard({
    super.key,
    required this.papaEntulho,
    required this.onEdit,
    required this.onDelete,
  });

  Color _getStatusColor() {
    switch (papaEntulho.status) {
      case Status.disponivel:
        return Colors.green;
      case Status.hoje:
        return Colors.amber[900]!;
      case Status.alugado:
        return Colors.orange;
      case Status.atrasado:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final papaEntulhoController = Get.find<PapaEntulhoController>();
    return Stack(
      children: [
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24), // Espaço para o status flutuante
                Row(
                  children: [
                    Expanded(
                      child: SelectableText(
                        papaEntulho.description,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.grey),
                    const SizedBox(width: 8),
                    SelectableText(
                      papaEntulho.address,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(width: 16),
                    const Icon(Icons.phone, color: Colors.black),
                    const SizedBox(width: 8),
                    SelectableText(
                      papaEntulho.phone,
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.event, color: Colors.black),
                    const SizedBox(width: 8),
                    Text(
                      'Início: ${DateFormat('dd/MM/yyyy').format(papaEntulho.dateInitial)}',
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    const SizedBox(width: 16),
                    const Icon(Icons.event, color: Colors.black),
                    const SizedBox(width: 8),
                    Text(
                      'Fim: ${DateFormat('dd/MM/yyyy').format(papaEntulho.dateFinal)}',
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.fire_truck, color: Colors.black),
                    const SizedBox(width: 8),
                    Text(
                      'Quantidade: ${papaEntulho.quantity}',
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Theme.of(context).primaryColor),
                      onPressed: onEdit,
                    ),
                    IconButton(
                      icon: const Icon(Icons.notification_add, color: Colors.blue),
                      onPressed: () {
                        final eventUrl = Uri.parse('https://www.google.com/calendar/render?action=TEMPLATE'
                            '&text=Cobrar+Papa+Entulho+-+${papaEntulho.description.replaceAll(' ', '+')}'
                            '&dates=${DateFormat("yyyyMMdd").format(papaEntulho.dateFinal)}'
                            '/${DateFormat("yyyyMMdd").format(papaEntulho.dateFinal)}'
                            '&details=${papaEntulho.description}'
                            '&location=${papaEntulho.address}');
                        launchUrl(eventUrl).then((success) {
                          if (!success) {
                            showError('Erro ao abrir o Google Calendar');
                          }
                        });
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: onDelete,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Status flutuante no canto superior esquerdo
        Positioned(
          top: 8,
          right: 8,
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: _getStatusColor(),
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(2, 2)),
                ],
              ),
              child: switch (papaEntulho.status) {
                Status.disponivel =>
                  Text(papaEntulhoController.daysForStart(papaEntulho.dateInitial), style: const TextStyle(color: Colors.white)),
                Status.alugado => Text('ALUGADO: ${papaEntulhoController.daysRemaining(papaEntulho.dateFinal)}',
                    style: const TextStyle(color: Colors.white)),
                Status.atrasado => const Text('ATRASADO', style: TextStyle(color: Colors.white)),
                Status.hoje => const Text('VENCE HOJE', style: TextStyle(color: Colors.white)),
              }),
        ),
      ],
    );
  }
}
