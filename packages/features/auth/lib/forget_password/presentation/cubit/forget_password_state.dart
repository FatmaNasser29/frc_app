enum ForgetPasswordStatus { initial, loading, success, error }

class ForgetPasswordState {
  final ForgetPasswordStatus status;
  final String? message;
  final String? errorMessage;

  const ForgetPasswordState({
    this.status = ForgetPasswordStatus.initial,
    this.message,
    this.errorMessage,
  });

  ForgetPasswordState copyWith({
    ForgetPasswordStatus? status,
    String? message,
    String? errorMessage,
  }) {
    return ForgetPasswordState(
      status: status ?? this.status,
      message: message ?? this.message,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
