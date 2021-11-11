import 'package:coinbase_api/coinbase_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticker.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Ticker extends WebSocketResponse {
  Ticker(
    this.type,
    this.sequence,
    this.productId,
    this.price,
    this.open24h,
    this.volume24h,
    this.low24h,
    this.high24h,
    this.volume30d,
    this.bestBid,
    this.bestAsk,
    this.side,
    this.time,
    this.tradeId,
    this.lastSize,
  );

  final String type;
  final int sequence;
  final String productId;
  @StringToDoubleConverter()
  final double price;

  @StringToDoubleConverter()
  @JsonKey(name: 'open_24h')
  final double open24h;

  @StringToDoubleConverter()
  @JsonKey(name: 'volume_24h')
  final double volume24h;

  @StringToDoubleConverter()
  @JsonKey(name: 'low_24h')
  final double low24h;

  @StringToDoubleConverter()
  @JsonKey(name: 'high_24h')
  final double high24h;

  @StringToDoubleConverter()
  @JsonKey(name: 'volume_30d')
  final double volume30d;

  @StringToDoubleConverter()
  final double bestBid;
  @StringToDoubleConverter()
  final double bestAsk;

  final String side;
  final DateTime time;
  final int? tradeId;
  @StringToDoubleConverter()
  final double lastSize;

  factory Ticker.fromJson(Map<String, dynamic> json) => _$TickerFromJson(json);

  Map<String, dynamic> toJson() => _$TickerToJson(this);
}
