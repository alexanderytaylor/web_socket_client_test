import 'package:coinbase_api/coinbase_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'websocket_error.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class WebSocketError extends WebSocketResponse {
  final String type;
  final String? message;
  final String? reason;

  WebSocketError({
    required this.type,
    this.message,
    this.reason,
  });

  factory WebSocketError.fromJson(Map<String, dynamic> json) =>
      _$WebSocketErrorFromJson(json);
}
