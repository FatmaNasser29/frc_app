import 'package:flutter/material.dart';
import 'package:frc_app/config/l10n/l10n_extension.dart';
import 'package:frc_app/config/routes/routes_name.dart';
import 'package:frc_app/config/theme/app_theme.dart';
import 'package:frc_app/config/utils/shared_widgets/custom_eleveted_button.dart';
import 'package:frc_app/config/utils/shared_widgets/shared_gradient_background_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class SignUpOptionView extends StatelessWidget {
  const SignUpOptionView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      body: AuthGradientBackground(
        title: l10n.chooseSignInOptionTitle,
        child: Column(
          children: [
            CustomElevatedButton(
              text: l10n.signWithGoogle,
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
              text: l10n.signWithLinkedin,
              textColor: Colors.white,
              icon: Image.asset(
                'assets/icons/linkedin_icon.png',
                width: 24,
                height: 24,
              ),
              backgroundColor: const Color(0xff0066D9),
              onPressed: loginWithLinkedin,
            ),
            const SizedBox(height: 20),
            Text(
              l10n.orContinueWith,
              style: context.textStyle.textStyle16.copyWith(
                color: Colors.white,
              ),
            ),

            CustomElevatedButton(
              text: l10n.yourPhoneNumber,
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

  Future<void> loginWithLinkedin() async {
    final redirectUrl = Uri.encodeComponent('https://fashionretailclub.com');

    final url = Uri.parse(
      'https://api.fashionretailclub.com/api/v1/auth/linkedin'
      '?redirectUrl=$redirectUrl',
    );

    await launchUrl(url, mode: LaunchMode.externalApplication);
  }
}
