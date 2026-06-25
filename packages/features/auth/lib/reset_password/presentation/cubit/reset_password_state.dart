enum ResetPasswordStatus { initial, loading, success, error }

class ResetPasswordState {
  final ResetPasswordStatus status;
  final String? message;
  final String? errorMessage;

  const ResetPasswordState({
    this.status = ResetPasswordStatus.initial,
    this.message,
    this.errorMessage,
  });

  ResetPasswordState copyWith({
    ResetPasswordStatus? status,
    String? message,
    String? errorMessage,
  }) {
    return ResetPasswordState(
      status: status ?? this.status,
      message: message ?? this.message,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
