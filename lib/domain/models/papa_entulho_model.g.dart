// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'papa_entulho_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PapaEntulhoModel _$PapaEntulhoModelFromJson(Map<String, dynamic> json) =>
    PapaEntulhoModel(
      id: json['id'] as String?,
      description: json['description'] as String?,
      address: json['address'] as String,
      phone: json['phone'] as String,
      dateInitial: DateTime.parse(json['dateInitial'] as String),
      dateFinal: DateTime.parse(json['dateFinal'] as String),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$PapaEntulhoModelToJson(PapaEntulhoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'address': instance.address,
      'phone': instance.phone,
      'dateInitial': instance.dateInitial.toIso8601String(),
      'dateFinal': instance.dateFinal.toIso8601String(),
      'quantity': instance.quantity,
    };
