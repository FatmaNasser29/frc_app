import 'package:json_annotation/json_annotation.dart';

part 'verify_registration_request.g.dart';

@JsonSerializable()
class VerifyRegistrationRequest {
  final String phoneNumber;
  final String otp;

  const VerifyRegistrationRequest({
    required this.phoneNumber,
    required this.otp,
  });

  factory VerifyRegistrationRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyRegistrationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyRegistrationRequestToJson(this);
}
