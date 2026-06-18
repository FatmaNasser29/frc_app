enum SignupStatus {
  initial,
  loading,
  success,
  error,
}

class SignupState {
  final SignupStatus status;
  final String? message;
  final String? errorMessage;

  const SignupState({
    this.status = SignupStatus.initial,
    this.message,
    this.errorMessage,
  });

  SignupState copyWith({
    SignupStatus? status,
    String? message,
    String? errorMessage,
  }) {
    return SignupState(
      status: status ?? this.status,
      message: message ?? this.message,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}



  