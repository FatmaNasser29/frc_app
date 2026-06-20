import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frc_app/config/routes/routes_name.dart';
import 'package:frc_app/config/theme/app_colors_pallet.dart';
import 'package:frc_app/config/theme/app_text_style.dart';
import 'package:frc_app/config/utils/shared_widgets/custom_eleveted_button.dart';
import 'package:frc_app/config/utils/shared_widgets/shared_gradient_background_widget.dart';

class ForgetPasswordOtpView extends StatefulWidget {
  final String phoneNumber;

  const ForgetPasswordOtpView({super.key, required this.phoneNumber});

  @override
  State<ForgetPasswordOtpView> createState() => _SignUpOtpViewState();
}

class _SignUpOtpViewState extends State<ForgetPasswordOtpView> {
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
    return Scaffold(
      body: AuthGradientBackground(
        title: 'Verify OTP',
        description: 'Enter the verification code sent to your WhatsApp number',
        child: Column(
          children: [
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
                          borderSide: BorderSide(color: AppColorsPallet.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(color: AppColorsPallet.white),
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

            CustomElevatedButton(
              text: 'Verify',
              onPressed: () {
                final otp = otpCode.trim();

                if (otp.length != 6) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter the 6-digit OTP'),
                    ),
                  );
                  return;
                }

                Navigator.pushNamed(
                  context,
                  RoutesName.resetPassword,
                  arguments: {'phoneNumber': widget.phoneNumber, 'otp': otp},
                );
              },
            ),

            const SizedBox(height: 12),

            TextButton(
              onPressed: secondsRemaining == 0
                  ? () {
                      startTimer();

                      // debugPrint('Resend OTP to ${widget.phoneNumber}');

                      // TODO: Call Resend OTP API
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
    );
  }
}
