enum ResendOtpStatus { initial, loading, success, error }

class ResendOtpState {
  final ResendOtpStatus resendStatus;
  final String? message;
  final String? errorMessage;

  const ResendOtpState({
    this.resendStatus = ResendOtpStatus.initial,
    this.message,
    this.errorMessage,
  });

  ResendOtpState copyWith({
    ResendOtpStatus? resendStatus,
    String? message,
    String? errorMessage,
  }) {
    return ResendOtpState(
      resendStatus: resendStatus ?? this.resendStatus,
      message: message ?? this.message,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
