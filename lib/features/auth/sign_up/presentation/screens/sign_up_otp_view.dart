import 'package:flutter/material.dart';
import 'package:frc_app/config/utils/shared_widgets/custom_eleveted_button.dart';
import 'package:frc_app/config/utils/shared_widgets/shared_gradient_background_widget.dart';

class SignUpOtpView extends StatelessWidget {
  const SignUpOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthGradientBackground(
        title: 'Verify OTP',
        description:
            'Enter the verification code sent to your WhatsApp number.',
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                maxLength: 30,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  letterSpacing: 10,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  counterText: '',
                  hintText: '------',
                  hintStyle: TextStyle(
                    color: Colors.white.withValues(alpha: .5),
                    letterSpacing: 10,
                  ),
                  filled: true,
                  fillColor: Colors.white24,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            CustomElevatedButton(
              text: 'Verify',
              onPressed: () {
                // Verify OTP API
              },
            ),

            TextButton(
              onPressed: () {
                // Resend OTP API
              },
              child: const Text(
                'Resend Code',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
