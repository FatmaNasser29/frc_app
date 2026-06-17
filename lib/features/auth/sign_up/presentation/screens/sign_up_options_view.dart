import 'package:flutter/material.dart';
import 'package:frc_app/config/routes/routes_name.dart';
import 'package:frc_app/config/theme/app_text_style.dart';
import 'package:frc_app/config/utils/shared_widgets/custom_eleveted_button.dart';
import 'package:frc_app/config/utils/shared_widgets/shared_gradient_background_widget.dart';


class SignUpOptionView extends StatelessWidget {
  const SignUpOptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthGradientBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 50),
              
                  Image.asset(
                    'assets/images/frc_logo.png',
                    width: 180,color: Colors.white,
                  ),
              
                  const SizedBox(height: 22),
              
                   Text(
                    'The Fashion Industry Network',
                    style: AppTextStyle.internal().textStyle16.copyWith(
                          color: Colors.white,
                        ),
                  ),
              
                  SizedBox(height: 48),
              
                
                   Text(
                    'Choose Your Best\nSign in Option',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              
                  const SizedBox(height: 50),
              
                  CustomElevatedButton(
                    text: 'Sign With Google',
                    textColor: Colors.white,
                    icon: Image.asset(
                  'assets/icons/google_icon.png',
                  width: 24,
                  height: 24,
                ),
                    backgroundColor: Colors.black,
                   onPressed: () {},
                  ),
              
                  CustomElevatedButton(
                    text: 'Sign With Linkedin',
                    textColor: Colors.white,
                    icon: Image.asset(
                  'assets/icons/linkedin_icon.png',
                   width: 24,
                  height: 24,
                   ),
                    backgroundColor: const Color(0xff0066D9),
                    onPressed: () {},
                  ),
              
                   Text(
                    'Or Continue With',
                    style: AppTextStyle.internal().textStyle16.copyWith(color: Colors.white)
                  ),
              
                  CustomElevatedButton(
                    text: 'Your Phone Number',
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        RoutesName.signUp,
                      );
                    }, 
                  ),
                   
                   Text(
                    'Connect with top professionals locally',
                                      style: AppTextStyle.internal().textStyle16.copyWith(color: Colors.white)
               
                  ),
              
                  // const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}