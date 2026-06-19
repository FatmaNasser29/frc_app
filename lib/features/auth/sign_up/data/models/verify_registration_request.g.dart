// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_registration_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyRegistrationRequest _$VerifyRegistrationRequestFromJson(
  Map<String, dynamic> json,
) => VerifyRegistrationRequest(
  phoneNumber: json['phoneNumber'] as String,
  otp: json['otp'] as String,
);

Map<String, dynamic> _$VerifyRegistrationRequestToJson(
  VerifyRegistrationRequest instance,
) => <String, dynamic>{
  'phoneNumber': instance.phoneNumber,
  'otp': instance.otp,
};
