import 'package:coinbase_api/coinbase_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'currency.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Currency {
  const Currency({
    required this.id,
    required this.name,
    required this.minSize,
    required this.status,
    required this.fundingAccountId,
    this.statusMessage,
    required this.maxPrecision,
    this.convertibleTo,
    required this.details,
  });

  final String id;
  final String name;
  @StringToDoubleConverter()
  final String minSize;
  final String status;
  final String fundingAccountId;
  final String? statusMessage;
  @StringToDoubleConverter()
  final String maxPrecision;
  final List<String>? convertibleTo;
  final CurrencyDetails details;

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyToJson(this);
}
