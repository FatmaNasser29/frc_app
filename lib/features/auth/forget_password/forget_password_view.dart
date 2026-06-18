import 'package:flutter/material.dart';
import 'package:frc_app/config/theme/app_colors_pallet.dart';
import 'package:frc_app/config/theme/app_text_style.dart';
import 'package:frc_app/config/utils/shared_widgets/custom_eleveted_button.dart';
import 'package:frc_app/config/utils/shared_widgets/custom_text_form_field.dart';
import 'package:frc_app/config/utils/shared_widgets/shared_gradient_background_widget.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthGradientBackground(
        title: 'Forget Password',
        description:
            'Enter your phone number and a message will be sent to your WhatsApp account that include a link to change your password',
        descriptionStyle: AppTextStyle.internal().textStyle14.copyWith(
          color: AppColorsPallet.white,
        ),
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

            const SizedBox(height: 40),

            CustomElevatedButton(text: 'Send', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
