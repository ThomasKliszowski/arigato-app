// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terminal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TerminalRegistrationResponse _$TerminalRegistrationResponseFromJson(
    Map<String, dynamic> json) {
  return TerminalRegistrationResponse(
    id: json['id'] as int,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$TerminalRegistrationResponseToJson(
        TerminalRegistrationResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'token': instance.token,
    };
