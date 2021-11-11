import 'package:json_annotation/json_annotation.dart';

part 'subscribed_channel.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SubscribedChannel {
  const SubscribedChannel({
    required this.name,
    required this.productIds,
  });

  final String name;
  final List<String> productIds;

  factory SubscribedChannel.fromJson(Map<String, dynamic> json) =>
      _$SubscribedChannelFromJson(json);

  Map<String, dynamic> toJson() => _$SubscribedChannelToJson(this);
}
