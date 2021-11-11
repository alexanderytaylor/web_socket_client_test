import 'package:coinbase_api/coinbase_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'status.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Status extends WebSocketResponse {
  final String type;
  final List<Product> products;
  final List<Currency> currencies;

  Status({
    required this.type,
    required this.products,
    required this.currencies,
  });

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}
