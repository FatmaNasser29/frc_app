import 'package:flutter/material.dart';
import 'package:frc_app/config/utils/shared_widgets/custom_eleveted_button.dart';
import 'package:frc_app/config/utils/shared_widgets/custom_text_form_field.dart';
import 'package:frc_app/config/utils/shared_widgets/shared_gradient_background_widget.dart';

class SetNewPasswordView extends StatelessWidget {
  const SetNewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthGradientBackground(
        title: 'Set New Password',
        description:
            'Enter your new password and confirm to set the new password to your account',
        child: Column(
          children: [
            CustomTextFormField(
              label: 'New Password',
              hintText: 'Password123',
              obscureText: true,
              prefixIcon: Image.asset(
                'assets/icons/lock_icon.png',
                width: 20,
                height: 20,
              ),
            ),

            const SizedBox(height: 20),

            CustomTextFormField(
              label: 'Confirm New Password',
              hintText: 'Password123',
              obscureText: true,
              prefixIcon: Image.asset(
                'assets/icons/lock_icon.png',
                width: 20,
                height: 20,
              ),
            ),

            const SizedBox(height: 40),

            CustomElevatedButton(text: 'Submit', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
