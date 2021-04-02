import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

import '../backend.dart';

part 'terminal.g.dart';

class BackendTerminal {
  final _client = Dio(BaseOptions(baseUrl: BackendService.kHttpsEndpoint));

  Future<TerminalRegistrationResponse> create() async {
    final response = await _client.post('/terminals/new');
    return TerminalRegistrationResponse.fromJson(response.data);
  }
}

@JsonSerializable()
class TerminalRegistrationResponse {
  const TerminalRegistrationResponse({
    this.id,
    this.token,
  });

  final int id;
  final String token;

  static TerminalRegistrationResponse fromJson(Map<String, dynamic> value) =>
      value == null ? null : _$TerminalRegistrationResponseFromJson(value);
}
