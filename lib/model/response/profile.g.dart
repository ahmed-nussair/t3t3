// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return Profile(
    json['id'] as int,
    json['first_name'] as String,
    json['last_name'] as String,
    json['username'] as String,
    json['email'] as String,
    json['phone'] as String,
    json['country'] == null
        ? null
        : Country.fromJson(json['country'] as Map<String, dynamic>),
    json['location'] == null
        ? null
        : Location.fromJson(json['location'] as Map<String, dynamic>),
    json['token'] as String,
  )..imageUrl = json['image_url'] as String;
}

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'image_url': instance.imageUrl,
      'country': instance.country,
      'location': instance.location,
      'token': instance.token,
    };
