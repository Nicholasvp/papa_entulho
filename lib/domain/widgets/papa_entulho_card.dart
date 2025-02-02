import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:papa_entulho/domain/enums/enums.dart';
import 'package:papa_entulho/domain/models/papa_entulho_model.dart';

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
      case Status.alugado:
        return Colors.blue;
      case Status.atrasado:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    const Icon(Icons.description, color: Colors.black54),
                    const SizedBox(width: 8),
                    Expanded(
                      child: SelectableText(
                        papaEntulho.description,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.grey),
                    const SizedBox(width: 8),
                    Expanded(
                      child: SelectableText(
                        papaEntulho.address,
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
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
                    const Icon(Icons.date_range, color: Colors.black),
                    const SizedBox(width: 8),
                    Text(
                      'Início: ${DateFormat('dd/MM/yyyy').format(papaEntulho.dateInitial)}',
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
                      'Fim: ${DateFormat('dd/MM/yyyy').format(papaEntulho.dateFinal)}',
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.confirmation_number, color: Colors.black),
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
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: onEdit,
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
            child: Text(
              papaEntulho.status.name.toUpperCase(),
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
