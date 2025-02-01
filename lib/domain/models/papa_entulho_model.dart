import 'package:json_annotation/json_annotation.dart';
import 'package:papa_entulho/domain/enums/enums.dart';

part 'papa_entulho_model.g.dart';

@JsonSerializable()
class PapaEntulhoModel {
  final String? id;
  final String? description;
  final String address;
  final String phone;
  final DateTime dateInitial;
  final DateTime dateFinal;
  final int quantity;
  final Status status;

  factory PapaEntulhoModel.fromJson(Map<String, dynamic> json) => _$PapaEntulhoModelFromJson(json);

  PapaEntulhoModel(
      {this.id,
      required this.description,
      required this.address,
      required this.phone,
      required this.dateInitial,
      required this.dateFinal,
      required this.quantity,
      required this.status});

  Map<String, dynamic> toJson() => _$PapaEntulhoModelToJson(this);
}
