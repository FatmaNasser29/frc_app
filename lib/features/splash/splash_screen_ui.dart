import 'package:flutter/material.dart';
import 'package:frc_app/config/utils/shared_widgets/custom_text_form_field.dart';

class SplashScreenUi extends StatelessWidget {
  const SplashScreenUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash Screen'),
      ),
      body: 
        Center(child: CustomTextFormField(hintText: 'Enter your text here',prefixIcon: Icons.text_fields, )),
    );
  }
}