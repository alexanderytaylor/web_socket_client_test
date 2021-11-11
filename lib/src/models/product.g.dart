// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as String,
      baseCurrency: json['base_currency'] as String,
      quoteCurrency: json['quote_currency'] as String,
      baseMinSize: json['base_min_size'] as String,
      baseMaxSize: json['base_max_size'] as String,
      baseIncrement: json['base_increment'] as String,
      quoteIncrement: json['quote_increment'] as String,
      displayName: json['display_name'] as String,
      status: json['status'] as String,
      marginEnabled: json['margin_enabled'] as bool,
      statusMessage: json['status_message'] as String,
      minMarketFunds: json['min_market_funds'] as String,
      maxMarketFunds: json['max_market_funds'] as String,
      postOnly: json['post_only'] as bool,
      limitOnly: json['limit_only'] as bool,
      cancelOnly: json['cancel_only'] as bool,
      auctionMode: json['auction_mode'] as bool,
      type: json['type'] as String,
      tradingDisabled: json['trading_disabled'] as bool?,
      fxStablecoin: json['fx_stablecoin'] as bool?,
      maxSlippagePercentage: json['max_slippage_percentage'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'base_currency': instance.baseCurrency,
      'quote_currency': instance.quoteCurrency,
      'base_min_size': instance.baseMinSize,
      'base_max_size': instance.baseMaxSize,
      'base_increment': instance.baseIncrement,
      'quote_increment': instance.quoteIncrement,
      'display_name': instance.displayName,
      'status': instance.status,
      'margin_enabled': instance.marginEnabled,
      'status_message': instance.statusMessage,
      'min_market_funds': instance.minMarketFunds,
      'max_market_funds': instance.maxMarketFunds,
      'post_only': instance.postOnly,
      'limit_only': instance.limitOnly,
      'cancel_only': instance.cancelOnly,
      'auction_mode': instance.auctionMode,
      'type': instance.type,
      'trading_disabled': instance.tradingDisabled,
      'fx_stablecoin': instance.fxStablecoin,
      'max_slippage_percentage': instance.maxSlippagePercentage,
    };
