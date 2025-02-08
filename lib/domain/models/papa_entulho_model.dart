import 'package:json_annotation/json_annotation.dart';
import 'package:papa_entulho/domain/enums/enums.dart';

part 'papa_entulho_model.g.dart';

@JsonSerializable()
class PapaEntulhoModel {
  final String? id;
  final String userId;
  final String description;
  final String address;
  final String phone;
  final DateTime dateInitial;
  final DateTime dateFinal;
  final int quantity;

  factory PapaEntulhoModel.fromJson(Map<String, dynamic> json) => _$PapaEntulhoModelFromJson(json);

  PapaEntulhoModel({
    this.id,
    required this.userId,
    required this.description,
    required this.address,
    required this.phone,
    required this.dateInitial,
    required this.dateFinal,
    required this.quantity,
  });

  Status get status {
    final now = DateTime.now();
    if (now.year == dateFinal.year && now.month == dateFinal.month && now.day == dateFinal.day) {
      return Status.hoje;
    } else if (now.isAfter(dateFinal)) {
      return Status.atrasado;
    } else if (now.isAfter(dateInitial) && now.isBefore(dateFinal)) {
      return Status.alugado;
    } else {
      return Status.disponivel;
    }
  }

  Map<String, dynamic> toJson() => _$PapaEntulhoModelToJson(this);
}
