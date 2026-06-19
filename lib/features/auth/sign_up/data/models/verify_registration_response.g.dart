// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_registration_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyRegistrationResponse _$VerifyRegistrationResponseFromJson(
  Map<String, dynamic> json,
) => VerifyRegistrationResponse(
  message: json['message'] as String,
  accessToken: json['access_token'] as String,
  refreshToken: json['refresh_token'] as String,
);

Map<String, dynamic> _$VerifyRegistrationResponseToJson(
  VerifyRegistrationResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'access_token': instance.accessToken,
  'refresh_token': instance.refreshToken,
};
