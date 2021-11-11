// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Currency _$CurrencyFromJson(Map<String, dynamic> json) => Currency(
      id: json['id'] as String,
      name: json['name'] as String,
      minSize: json['min_size'] as String,
      status: json['status'] as String,
      fundingAccountId: json['funding_account_id'] as String,
      statusMessage: json['status_message'] as String?,
      maxPrecision: json['max_precision'] as String,
      convertibleTo: (json['convertible_to'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      details:
          CurrencyDetails.fromJson(json['details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrencyToJson(Currency instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'min_size': instance.minSize,
      'status': instance.status,
      'funding_account_id': instance.fundingAccountId,
      'status_message': instance.statusMessage,
      'max_precision': instance.maxPrecision,
      'convertible_to': instance.convertibleTo,
      'details': instance.details.toJson(),
    };
