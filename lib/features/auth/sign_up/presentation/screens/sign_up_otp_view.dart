import 'package:flutter/material.dart';
import 'package:frc_app/config/utils/shared_widgets/custom_eleveted_button.dart';
import 'package:frc_app/config/utils/shared_widgets/custom_text_form_field.dart';
import 'package:frc_app/config/utils/shared_widgets/shared_gradient_background_widget.dart';
import 'package:frc_app/config/validator/app_validator.dart';

class SignUpOtpView extends StatefulWidget {
  final String phoneNumber;

  const SignUpOtpView({super.key, required this.phoneNumber});

  @override
  State<SignUpOtpView> createState() => _SignUpOtpViewState();
}

class _SignUpOtpViewState extends State<SignUpOtpView> {
  final otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthGradientBackground(
        title: 'Verify OTP',
        description: 'Enter the verification code sent to your WhatsApp number',
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  widget.phoneNumber,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ),

              const SizedBox(height: 24),

              CustomTextFormField(
                controller: otpController,
                label: 'OTP Code',
                hintText: 'Please enter OTP code',
                keyboardType: TextInputType.number,
                validator: AppValidators.validateOtp,
              ),

              const SizedBox(height: 40),

              CustomElevatedButton(
                text: 'Verify',
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }

                  debugPrint('OTP => ${otpController.text.trim()}');
                },
              ),

              const SizedBox(height: 12),

              TextButton(
                onPressed: () {
                  debugPrint('Resend OTP to ${widget.phoneNumber}');
                },
                child: const Text(
                  'Resend Code',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
