import 'package:json_annotation/json_annotation.dart';
part 'signin_request.g.dart';

@JsonSerializable()
class SigninRequest {
  final String phoneNumber;
  final String password;
  const SigninRequest({required this.phoneNumber, required this.password});
  factory SigninRequest.fromJson(Map<String, dynamic> json) =>
      _$SigninRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SigninRequestToJson(this);
}
