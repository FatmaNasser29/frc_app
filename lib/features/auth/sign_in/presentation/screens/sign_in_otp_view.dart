import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frc_app/config/routes/routes_name.dart';
import 'package:frc_app/config/theme/app_colors_pallet.dart';
import 'package:frc_app/config/theme/app_text_style.dart';
import 'package:frc_app/config/utils/shared_widgets/custom_eleveted_button.dart';
import 'package:frc_app/config/utils/shared_widgets/shared_gradient_background_widget.dart';
import 'package:frc_app/features/auth/sign_in/presentation/cubit/signin_cubit.dart';
import 'package:frc_app/features/auth/sign_in/presentation/cubit/signin_state.dart';
import 'package:frc_app/features/auth/shared/presentation/cubit/resend_otp_cubit.dart';
import 'package:frc_app/features/auth/shared/presentation/cubit/resend_otp_state.dart';

class SignInOtpView extends StatefulWidget {
  final String phoneNumber;

  const SignInOtpView({super.key, required this.phoneNumber});

  @override
  State<SignInOtpView> createState() => _SignInOtpViewState();
}

class _SignInOtpViewState extends State<SignInOtpView> {
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

    debugPrint('SignInOtpView Opened => ${widget.phoneNumber}');

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

  String get otpCode => otpControllers.map((e) => e.text).join();

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
    return BlocListener<ResendOtpCubit, ResendOtpState>(
      listener: (context, state) {
        if (state.resendStatus == ResendOtpStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message ?? 'OTP resent successfully')),
          );
        }

        if (state.resendStatus == ResendOtpStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage ?? 'Failed to resend OTP'),
            ),
          );
        }
      },
      child: Scaffold(
        body: AuthGradientBackground(
          title: 'Verify OTP',
          description:
              'Enter the verification code sent to your WhatsApp number',
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  widget.phoneNumber,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.internal().textStyle16.copyWith(
                    color: AppColorsPallet.white.withValues(alpha: 0.8),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
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
                        style: AppTextStyle.internal().textStyle24.copyWith(
                          color: AppColorsPallet.white,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          counterText: '',
                          filled: true,
                          fillColor: Colors.white24,
                          contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide(
                              color: AppColorsPallet.white,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide(
                              color: AppColorsPallet.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide(
                              color: AppColorsPallet.white,
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

              BlocConsumer<SigninCubit, SigninState>(
                listener: (context, state) {
                  if (state.status == SigninStatus.verifySuccess) {
                    debugPrint('Verify Success => ${state.message}');

                    Navigator.pushReplacementNamed(context, RoutesName.home);
                  }

                  if (state.status == SigninStatus.verifyError) {
                    debugPrint('Verify Error => ${state.errorMessage}');

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          state.errorMessage ?? 'Something went wrong',
                        ),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return CustomElevatedButton(
                    text: state.status == SigninStatus.verifyLoading
                        ? 'Loading...'
                        : 'Verify',
                    onPressed: state.status == SigninStatus.verifyLoading
                        ? () {}
                        : () {
                            debugPrint('Verify Button Pressed');

                            debugPrint('Phone => ${widget.phoneNumber}');

                            debugPrint('OTP => $otpCode');

                            final otp = otpCode;

                            if (otp.length != 6) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please enter the 6-digit OTP'),
                                ),
                              );
                              return;
                            }

                            context.read<SigninCubit>().verifySigninOtp(
                              phoneNumber: widget.phoneNumber,
                              otp: otp,
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

                        debugPrint('Resend OTP => ${widget.phoneNumber}');

                        context.read<ResendOtpCubit>().resendOtp(
                          widget.phoneNumber,
                        );
                      }
                    : null,
                child: Text(
                  secondsRemaining == 0
                      ? 'Resend'
                      : '00:${secondsRemaining.toString().padLeft(2, '0')}',
                  style: AppTextStyle.internal().textStyle16.copyWith(
                    color: AppColorsPallet.white,
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
