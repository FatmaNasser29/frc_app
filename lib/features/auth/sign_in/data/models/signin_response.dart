import 'package:json_annotation/json_annotation.dart';

part 'signin_response.g.dart';

@JsonSerializable()
class SigninResponse {
  final String message;
  @JsonKey(name: 'access_token')
  final String accessToken;
  @JsonKey(name: 'refresh_token')
  final String refreshToken;
  const SigninResponse({
    required this.message,
    required this.accessToken,
    required this.refreshToken,
  });
  factory SigninResponse.fromJson(Map<String, dynamic> json) =>
      _$SigninResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SigninResponseToJson(this);
}
