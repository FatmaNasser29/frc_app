import 'package:json_annotation/json_annotation.dart';

part 'signup_request.g.dart';

@JsonSerializable()
class SignupRequest {
  final String fullName;
  final String phoneNumber;
  final String password;

  const SignupRequest({
    required this.fullName,
    required this.phoneNumber,
    required this.password,
  });

  factory SignupRequest.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$SignupRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SignupRequestToJson(this);
}