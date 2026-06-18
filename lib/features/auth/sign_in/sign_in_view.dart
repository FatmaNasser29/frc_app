import 'package:flutter/material.dart';
import 'package:frc_app/config/utils/shared_widgets/custom_eleveted_button.dart';
import 'package:frc_app/config/utils/shared_widgets/custom_text_button.dart';
import 'package:frc_app/config/utils/shared_widgets/custom_text_form_field.dart';
import 'package:frc_app/config/utils/shared_widgets/shared_gradient_background_widget.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthGradientBackground(
        title: 'Login to Your Account',
        child: Column(
          children: [
            CustomTextFormField(
              label: 'Phone',
              hintText: '+20 11 5555 6600',
              prefixIcon: Image.asset(
                'assets/icons/envelope_icon.png',
                width: 20,
                height: 20,
              ),
            ),

            const SizedBox(height: 20),

            CustomTextFormField(
              label: 'Password',
              hintText: 'Password123',
              obscureText: true,
              prefixIcon: Image.asset(
                'assets/icons/lock_icon.png',
                width: 20,
                height: 20,
              ),
            ),

            const SizedBox(height: 6),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 46.5),
              child: Row(
                children: [
                  CustomTextButton(text: 'Remember me'),
                  const Spacer(),
                  CustomTextButton(
                    onPressed: () {},
                    text: 'Forgot password?',
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),

            CustomElevatedButton(text: 'Sign In', onPressed: () {}),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 44),
              child: Row(
                children: [
                  CustomTextButton(text: "Don't have an account?"),
                  const Spacer(),
                  CustomTextButton(
                    onPressed: () {},
                    text: 'Sign Up',
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
