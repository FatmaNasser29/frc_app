part of 'stay_tuned_cubit.dart';

enum StayTunedStatus { initial, loading, success, error }

class StayTunedState {
  final StayTunedStatus status;
  final String? message;
  final String? errorMessage;

  const StayTunedState({
    this.status = StayTunedStatus.initial,
    this.message,
    this.errorMessage,
  });

  StayTunedState copyWith({
    StayTunedStatus? status,
    String? message,
    String? errorMessage,
  }) {
    return StayTunedState(
      status: status ?? this.status,
      message: message ?? this.message,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
