// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ticker _$TickerFromJson(Map<String, dynamic> json) => Ticker(
      json['type'] as String,
      json['sequence'] as int,
      json['product_id'] as String,
      const StringToDoubleConverter().fromJson(json['price'] as String),
      const StringToDoubleConverter().fromJson(json['open_24h'] as String),
      const StringToDoubleConverter().fromJson(json['volume_24h'] as String),
      const StringToDoubleConverter().fromJson(json['low_24h'] as String),
      const StringToDoubleConverter().fromJson(json['high_24h'] as String),
      const StringToDoubleConverter().fromJson(json['volume_30d'] as String),
      const StringToDoubleConverter().fromJson(json['best_bid'] as String),
      const StringToDoubleConverter().fromJson(json['best_ask'] as String),
      json['side'] as String,
      DateTime.parse(json['time'] as String),
      json['trade_id'] as int?,
      const StringToDoubleConverter().fromJson(json['last_size'] as String),
    );

Map<String, dynamic> _$TickerToJson(Ticker instance) => <String, dynamic>{
      'type': instance.type,
      'sequence': instance.sequence,
      'product_id': instance.productId,
      'price': const StringToDoubleConverter().toJson(instance.price),
      'open_24h': const StringToDoubleConverter().toJson(instance.open24h),
      'volume_24h': const StringToDoubleConverter().toJson(instance.volume24h),
      'low_24h': const StringToDoubleConverter().toJson(instance.low24h),
      'high_24h': const StringToDoubleConverter().toJson(instance.high24h),
      'volume_30d': const StringToDoubleConverter().toJson(instance.volume30d),
      'best_bid': const StringToDoubleConverter().toJson(instance.bestBid),
      'best_ask': const StringToDoubleConverter().toJson(instance.bestAsk),
      'side': instance.side,
      'time': instance.time.toIso8601String(),
      'trade_id': instance.tradeId,
      'last_size': const StringToDoubleConverter().toJson(instance.lastSize),
    };
