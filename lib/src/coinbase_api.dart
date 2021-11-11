import 'dart:convert';

import 'package:coinbase_api/coinbase_api.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

/// {@template coinbase_api_client}
/// A Dart API Client for Coinbase Cloud
/// {@endtemplate}
class CoinbaseApiClient {
  /// {@macro coinbase_api_client}
  CoinbaseApiClient();

  static const _authority = 'wss://ws-feed.exchange.coinbase.com';

  WebSocketChannel? _channel;
  Stream? _broadcastStream;
  bool _stayConnected = true;

  /// Initiate Websocket
  void initSocket() {
    _connect();

    _broadcastStream = _channel!.stream.asBroadcastStream();

    _broadcastStream!.listen(
      (message) {
        // Handle incoming messages
        _onMessage(message);
      },
      onError: (error) {
        // Handle errors
        _onConnError(error);
      },
      onDone: () {
        // Handle websocket closing
        // If websocket disconnects on its own, reconnect by calling _connect()
        if (_stayConnected) {
          _connect();
        }
        // If websocket was closed intentionally do nothing.
      },
    );
  }

  // TODO: Build on message
  void _onMessage(message) {}

  // TODO: Build on connection error
  void _onConnError(error) {}

  /// Initiate the connection to the coinbase websocket
  void _connect() {
    try {
      _channel ??= WebSocketChannel.connect(Uri.parse(_authority));
    } catch (_) {
      throw Exception('Error connecting to Coinbase WebSocket');
    }
  }

  /// Close the websocket connection
  Future<void> disconect() async {
    _stayConnected = false;
    if (_channel != null) {
      await _channel!.sink.close();
    }
  }

  /// Get a list of available Products
  Future<Status> getProducts() async {
    _sendMessage(
      type: Action.subscribe,
      channel: CoinbaseChannel.status,
    );

    final Status productList = await _broadcastStream!
        .map((event) => jsonDecode(event))
        .map((event) => _sortEvent(event))
        .firstWhere((event) => event is Status) as Status;

    _sendMessage(
      type: Action.unsubscribe,
      channel: CoinbaseChannel.status,
    );

    return productList;
  }

  /// Listen to a stream of real-time data for a particular product.
  Stream<Ticker> listenToProduct(String productId) {
    _sendMessage(
      type: Action.subscribe,
      channel: CoinbaseChannel.ticker,
      productId: productId,
    );

    return _broadcastStream!
        .map((event) => jsonDecode(event))
        .map((event) => _sortEvent(event))
        .where((event) => event is Ticker)
        .cast<Ticker>();
  }

  /// Cancel the stream of real-time data for a particular product.
  void stopListenToProduct(String productId) {
    _sendMessage(
      type: Action.unsubscribe,
      channel: CoinbaseChannel.ticker,
      productId: productId,
    );
  }

  /// Send a message to the websocket
  void _sendMessage({
    required Action type,
    required CoinbaseChannel channel,
    String? productId,
  }) {
    // Build json request
    final request =
        _buildMessage(type: type, channel: channel, productId: productId);

    // Send request to websocket
    _channel!.sink.add(request);
    print('Message sent: $request');
  }

  /// Build the message to send to the Websocket server
  String _buildMessage({
    required Action type,
    required CoinbaseChannel channel,
    String? productId,
  }) {
    final request = {
      'type': type.action(),
      'channels': [channel.channel()],
    };

    if (productId != null) request['product_ids'] = [productId];

    final json = jsonEncode(request);

    return json;
  }

  WebSocketResponse _sortEvent(Map<String, dynamic> event) {
    final String? type = event['type'];
    if (type == 'subscriptions') {
      return Subscriptions.fromJson(event);
    } else if (type == 'ticker') {
      return Ticker.fromJson(event);
    } else if (type == 'status') {
      return Status.fromJson(event);
    } else if (type == 'error') {
      return WebSocketError.fromJson(event);
    } else {
      throw Exception('An unkown event has occured: ${event.toString()}');
    }
  }
}
