import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frc_app/config/l10n/failure_localizer.dart';
import 'package:frc_app/config/l10n/l10n_extension.dart';
import 'package:frc_app/config/routes/routes_name.dart';
import 'package:frc_app/config/theme/app_theme.dart';
import 'package:frc_app/config/utils/shared_widgets/custom_eleveted_button.dart';
import 'package:frc_app/config/utils/shared_widgets/custom_snack_bar.dart';
import 'package:frc_app/config/utils/shared_widgets/shared_gradient_background_widget.dart';
import 'package:frc_app/features/auth/sign_up/presentation/cubit/signup_cubit.dart';
import 'package:frc_app/features/auth/sign_up/presentation/cubit/signup_states.dart';
import 'package:frc_app/features/auth/shared/resend_otp/presentation/cubit/resend_otp_cubit.dart';
import 'package:frc_app/features/auth/shared/resend_otp/presentation/cubit/resend_otp_state.dart';

class SignUpOtpView extends StatefulWidget {
  final String phoneNumber;

  const SignUpOtpView({super.key, required this.phoneNumber});

  @override
  State<SignUpOtpView> createState() => _SignUpOtpViewState();
}

class _SignUpOtpViewState extends State<SignUpOtpView> {
  final List<TextEditingController> otpControllers = List.generate(
    6,
    (_) => TextEditingController(),
  );

  final List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());

  int secondsRemaining = 40;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer?.cancel();

    setState(() {
      secondsRemaining = 40;
    });

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining <= 1) {
        timer.cancel();

        setState(() {
          secondsRemaining = 0;
        });
      } else {
        setState(() {
          secondsRemaining--;
        });
      }
    });
  }

  String get otpCode =>
      otpControllers.map((controller) => controller.text).join();

  @override
  void dispose() {
    timer?.cancel();

    for (final controller in otpControllers) {
      controller.dispose();
    }

    for (final focusNode in focusNodes) {
      focusNode.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocListener<ResendOtpCubit, ResendOtpState>(
      listener: (context, state) {
        if (state.resendStatus == ResendOtpStatus.success) {
          CustomSnackBar.showSuccess(
            context,
            state.message ?? l10n.otpResentSuccessfully,
          );
        }

        if (state.resendStatus == ResendOtpStatus.error) {
          CustomSnackBar.showError(
            context,
            FailureLocalizer.localize(l10n, state.errorMessage),
          );
        }
      },
      child: Scaffold(
        body: AuthGradientBackground(
          title: l10n.verifyOtp,
          description: l10n.verifyOtpDescription,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  widget.phoneNumber,
                  textAlign: TextAlign.center,
                  style: context.textStyle.textStyle16.copyWith(
                    color: Colors.white.withValues(alpha: 0.8),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    6,
                    (index) => SizedBox(
                      width: 48,
                      height: 56,
                      child: TextFormField(
                        controller: otpControllers[index],
                        focusNode: focusNodes[index],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        style: context.textStyle.textStyle24.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          counterText: '',
                          filled: true,
                          fillColor: Colors.white24,
                          contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty && index < 5) {
                            focusNodes[index + 1].requestFocus();
                          }

                          if (value.isEmpty && index > 0) {
                            focusNodes[index - 1].requestFocus();
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              BlocConsumer<SignupCubit, SignupState>(
                listener: (context, state) {
                  if (state.status == SignupStatus.verifySuccess) {
                    Navigator.pushReplacementNamed(context, RoutesName.home);
                  }

                  if (state.status == SignupStatus.verifyError) {
                    CustomSnackBar.showError(
                      context,
                      FailureLocalizer.localize(l10n, state.errorMessage),
                    );
                  }
                },
                builder: (context, state) {
                  return CustomElevatedButton(
                    text: state.status == SignupStatus.verifyLoading
                        ? l10n.loading
                        : l10n.verify,
                    onPressed: state.status == SignupStatus.verifyLoading
                        ? () {}
                        : () {
                            final otp = otpCode;

                            if (otp.length != 6) {
                              CustomSnackBar.showError(
                                context,
                                l10n.pleaseEnterSixDigitOtp,
                              );
                              return;
                            }

                            context.read<SignupCubit>().verifyOtp(
                              phoneNumber: widget.phoneNumber,
                              otp: otpCode,
                            );
                          },
                  );
                },
              ),

              const SizedBox(height: 12),

              TextButton(
                onPressed: secondsRemaining == 0
                    ? () {
                        startTimer();

                        context.read<ResendOtpCubit>().resendOtp(
                          widget.phoneNumber,
                        );
                      }
                    : null,
                child: Text(
                  secondsRemaining == 0
                      ? l10n.resend
                      : l10n.resendCountdownText(secondsRemaining),
                  style: context.textStyle.textStyle16.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
