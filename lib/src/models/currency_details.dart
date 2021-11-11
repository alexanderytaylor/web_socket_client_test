import 'package:json_annotation/json_annotation.dart';

part 'currency_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CurrencyDetails {
  const CurrencyDetails({
    this.type,
    this.symbol,
    this.networkConfirmations,
    this.sortOrder,
    this.cryptoAddressLink,
    this.cryptoTransactionLink,
    this.pushPaymentMethods,
    this.minWithdrawalAmount,
    this.maxWithdrawalAmount,
    this.groupTypes,
    this.displayName,
    this.processingTimeSeconds,
  });

  final String? type;
  final String? symbol;
  final int? networkConfirmations;
  final int? sortOrder;
  final String? cryptoAddressLink;
  final String? cryptoTransactionLink;
  final List<String>? pushPaymentMethods;
  final double? minWithdrawalAmount;
  final double? maxWithdrawalAmount;
  final List<String>? groupTypes;
  final String? displayName;
  final int? processingTimeSeconds;

  factory CurrencyDetails.fromJson(Map<String, dynamic> json) =>
      _$CurrencyDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyDetailsToJson(this);
}
