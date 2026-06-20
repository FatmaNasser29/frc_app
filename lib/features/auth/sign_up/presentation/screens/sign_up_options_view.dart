import 'package:flutter/material.dart';
import 'package:frc_app/config/routes/routes_name.dart';
import 'package:frc_app/config/theme/app_text_style.dart';
import 'package:frc_app/config/utils/shared_widgets/custom_eleveted_button.dart';
import 'package:frc_app/config/utils/shared_widgets/shared_gradient_background_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class SignUpOptionView extends StatelessWidget {
  const SignUpOptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthGradientBackground(
        title: 'Choose Your Best\n Sign in Option',
        child: Column(
          children: [
            CustomElevatedButton(
              text: 'Sign With Google',
              textColor: Colors.white,
              icon: Image.asset(
                'assets/icons/google_icon.png',
                width: 24,
                height: 24,
              ),
              backgroundColor: Colors.black,
              onPressed: loginWithGoogle,
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
            SizedBox(height: 20),
            Text(
              'Or Continue With',
              style: AppTextStyle.internal().textStyle16.copyWith(
                color: Colors.white,
              ),
            ),

            CustomElevatedButton(
              text: 'Your Phone Number',
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.signUp);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loginWithGoogle() async {
    final url = Uri.parse(
      'https://api.fashionretailclub.com/api/v1/auth/google',
    );

    await launchUrl(url, mode: LaunchMode.externalApplication);
  }
}
