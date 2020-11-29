// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return LoginResponse(
    json['result'] as bool,
    json['data'] == null
        ? null
        : Profile.fromJson(json['data'] as Map<String, dynamic>),
    json['message'] as String,
  );
}

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'data': instance.data,
      'message': instance.message,
    };
