// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SigninResponse _$SigninResponseFromJson(Map<String, dynamic> json) =>
    SigninResponse(
      message: json['message'] as String,
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
    );

Map<String, dynamic> _$SigninResponseToJson(SigninResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };
