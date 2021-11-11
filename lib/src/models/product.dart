import 'package:coinbase_api/coinbase_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Product {
  const Product({
    required this.id,
    required this.baseCurrency,
    required this.quoteCurrency,
    required this.baseMinSize,
    required this.baseMaxSize,
    required this.baseIncrement,
    required this.quoteIncrement,
    required this.displayName,
    required this.status,
    required this.marginEnabled,
    required this.statusMessage,
    required this.minMarketFunds,
    required this.maxMarketFunds,
    required this.postOnly,
    required this.limitOnly,
    required this.cancelOnly,
    required this.auctionMode,
    required this.type,
    this.tradingDisabled,
    this.fxStablecoin,
    required this.maxSlippagePercentage,
  });

  final String id;
  final String baseCurrency;
  final String quoteCurrency;
  @StringToDoubleConverter()
  final String baseMinSize;
  @StringToDoubleConverter()
  final String baseMaxSize;
  @StringToDoubleConverter()
  final String baseIncrement;
  @StringToDoubleConverter()
  final String quoteIncrement;
  final String displayName;
  final String status;
  final bool marginEnabled;
  final String statusMessage;
  @StringToDoubleConverter()
  final String minMarketFunds;
  @StringToDoubleConverter()
  final String maxMarketFunds;
  final bool postOnly;
  final bool limitOnly;
  final bool cancelOnly;
  final bool auctionMode;
  final String type;
  final bool? tradingDisabled;
  final bool? fxStablecoin;
  @StringToDoubleConverter()
  final String maxSlippagePercentage;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
