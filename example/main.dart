import 'dart:io';

import 'package:coinbase_api/coinbase_api.dart';
import 'package:very_good_analysis/very_good_analysis.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart';

Future<void> main() async {
  final client = CoinbaseApiClient()..initSocket();

  try {
    Status productList = await client.getProducts();

    print('Available Products:');
    for (var i = 0; i < productList.products.length; i++) {
      print(productList.products[i].displayName);
    }
  } catch (_) {
    print('getProducts failed');
  }

  print('---------------------------------------');

  try {
    const productId1 = 'ETH-USD';
    const productId2 = 'BTC-USD';

    final stream = client.listenToProduct(productId1);

    stream.listen(
      (ticker) {
        print('${ticker.productId}: ${ticker.price}');
      },
    );

    await Future.delayed(Duration(seconds: 5));

    client.stopListenToProduct(productId1);

    client.listenToProduct(productId2);

    await Future.delayed(Duration(seconds: 5));

    client.stopListenToProduct(productId2);
  } catch (e) {
    print('listenToProduct failed: $e');
  }
}
