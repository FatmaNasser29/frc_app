enum SigninStatus {
  initial,
  loading,
  success,
  error,

  verifyLoading,
  verifySuccess,
  verifyError,
}

class SigninState {
  final SigninStatus status;
  final String? message;
  final String? errorMessage;

  const SigninState({
    this.status = SigninStatus.initial,
    this.message,
    this.errorMessage,
  });

  SigninState copyWith({
    SigninStatus? status,
    String? message,
    String? errorMessage,
  }) {
    return SigninState(
      status: status ?? this.status,
      message: message ?? this.message,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
