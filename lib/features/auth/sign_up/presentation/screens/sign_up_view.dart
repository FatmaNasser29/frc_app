import 'package:flutter/material.dart';
import 'package:frc_app/config/theme/app_text_style.dart';
import 'package:frc_app/config/utils/shared_widgets/custom_eleveted_button.dart';
import 'package:frc_app/config/utils/shared_widgets/custom_text_form_field.dart';
import 'package:frc_app/config/utils/shared_widgets/shared_gradient_background_widget.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthGradientBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(height: 64, width: 166, color: Colors.transparent,
                    child: Image.asset(
                      'assets/images/frc_logo.png',
                      width: 180,
                      color: Colors.white,
                    ),
                  ),
                  
                  const SizedBox(height: 22),
                  
                   Text(
                    'The Fashion Industry Network',
                    style: AppTextStyle.internal().textStyle16.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  
                  const SizedBox(height: 48),
                  
                   Text(
                    'Create Your Account',
                    style: AppTextStyle.internal().textStyle24.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  
                  const SizedBox(height: 40),
                  
                  CustomTextFormField(
                    label: 'Full Name',
                    hintText: 'Ahmed Aly Najiub',
                    prefixIcon: Image.asset(
                    'assets/icons/person_icon.png',
                    width: 20,
                    height: 20,
                  ),
                    backgroundColor: Colors.white,
                    borderColor: Colors.transparent,
                    textColor: Colors.black54,
                  ),
                  
                  const SizedBox(height: 12),
                  
                  CustomTextFormField(
                    label: 'Phone',
                    hintText: '+20 11 5555 6600',
                    prefixIcon: Image.asset(
                  'assets/icons/envelope_icon.png',
                  width: 20,
                  height: 20,
                    ),
                  ),
                  
                  const SizedBox(height: 12),
                  
                  CustomTextFormField(
                    label: 'Password',
                    hintText: 'Password123',
                    prefixIcon: Image.asset(
                  'assets/icons/lock_icon.png',
                  width: 20,
                  height: 20,
                    ),
                    obscureText: true,
                  ),
                  
                  const SizedBox(height: 40),
                  
                  CustomElevatedButton(
                    text: 'Sign Up',
                    onPressed: () {},
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20,top: 16 ,bottom: 24),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Have an account?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  
                  const Text(
                    'Connect with top professionals locally',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}