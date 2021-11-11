enum CoinbaseChannel {
  ticker,
  status,
}

extension Channel on CoinbaseChannel {
  String channel() {
    if (this == CoinbaseChannel.ticker)
      return 'ticker';
    else
      return 'status';
  }
}
