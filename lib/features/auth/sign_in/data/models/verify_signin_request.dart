import 'package:json_annotation/json_annotation.dart';

part 'verify_signin_request.g.dart';

@JsonSerializable()
class VerifySigninRequest {
  final String phoneNumber;
  final String otp;

  const VerifySigninRequest({required this.phoneNumber, required this.otp});

  factory VerifySigninRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifySigninRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VerifySigninRequestToJson(this);
}
