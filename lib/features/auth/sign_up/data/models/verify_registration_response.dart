import 'package:json_annotation/json_annotation.dart';

part 'verify_registration_response.g.dart';

@JsonSerializable()
class VerifyRegistrationResponse {
  final String message;

  @JsonKey(name: 'access_token')
  final String accessToken;

  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  const VerifyRegistrationResponse({
    required this.message,
    required this.accessToken,
    required this.refreshToken,
  });

  factory VerifyRegistrationResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyRegistrationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyRegistrationResponseToJson(this);
}
