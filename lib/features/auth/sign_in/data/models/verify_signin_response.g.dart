// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_signin_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifySigninResponse _$VerifySigninResponseFromJson(
  Map<String, dynamic> json,
) => VerifySigninResponse(
  message: json['message'] as String,
  accessToken: json['access_token'] as String,
  refreshToken: json['refresh_token'] as String,
);

Map<String, dynamic> _$VerifySigninResponseToJson(
  VerifySigninResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'access_token': instance.accessToken,
  'refresh_token': instance.refreshToken,
};
