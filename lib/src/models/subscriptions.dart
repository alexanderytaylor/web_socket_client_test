import 'package:coinbase_api/coinbase_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subscriptions.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Subscriptions extends WebSocketResponse {
  Subscriptions({
    required this.type,
    required this.channels,
  });

  final String type;
  final List<SubscribedChannel> channels;

  factory Subscriptions.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionsFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionsToJson(this);
}
