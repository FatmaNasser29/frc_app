import 'package:json_annotation/json_annotation.dart';

part 'verify_signin_response.g.dart';

@JsonSerializable()
class VerifySigninResponse {
  final String message;

  @JsonKey(name: 'access_token')
  final String accessToken;

  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  const VerifySigninResponse({
    required this.message,
    required this.accessToken,
    required this.refreshToken,
  });

  factory VerifySigninResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifySigninResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerifySigninResponseToJson(this);
}
