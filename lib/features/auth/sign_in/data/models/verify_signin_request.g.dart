// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_signin_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifySigninRequest _$VerifySigninRequestFromJson(Map<String, dynamic> json) =>
    VerifySigninRequest(
      phoneNumber: json['phoneNumber'] as String,
      otp: json['otp'] as String,
    );

Map<String, dynamic> _$VerifySigninRequestToJson(
  VerifySigninRequest instance,
) => <String, dynamic>{
  'phoneNumber': instance.phoneNumber,
  'otp': instance.otp,
};
