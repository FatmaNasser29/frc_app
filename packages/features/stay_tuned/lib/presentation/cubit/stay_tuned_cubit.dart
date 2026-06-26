import 'package:flutter_bloc/flutter_bloc.dart';

part 'stay_tuned_state.dart';

class StayTunedCubit extends Cubit<StayTunedState> {
  StayTunedCubit() : super(const StayTunedState());

  Future<void> submit({required String contact}) async {
    emit(state.copyWith(status: StayTunedStatus.loading));

    await Future.delayed(const Duration(seconds: 1));

    emit(
      state.copyWith(
        status: StayTunedStatus.success,
        message: 'You have been added to our waitlist!',
      ),
    );
  }

  void reset() {
    emit(const StayTunedState());
  }
}
