import 'package:flutter/material.dart';
import 'package:frc_app/config/theme/app_colors_pallet.dart';
import 'package:frc_app/config/theme/app_gradients.dart';
import 'package:frc_app/config/theme/app_text_style.dart';

class AuthGradientBackground extends StatelessWidget {
  final Widget child;
  final String? title;
  final String? description;
  final String footerText;
  final TextStyle? descriptionStyle;

  const AuthGradientBackground({
    super.key,
    required this.child,
    this.title,
    this.description,
    this.descriptionStyle,
    this.footerText = 'Connect with top professionals locally',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(gradient: AppGradients.reverseGradient),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 64,
                          width: 166,
                          child: Image.asset(
                            'assets/images/frc_logo.png',
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 22),

                        Text(
                          'The Fashion Industry Network',
                          style: AppTextStyle.internal().textStyle16.copyWith(
                            color: AppColorsPallet.white,
                          ),
                        ),

                        if (title != null) ...[
                          const SizedBox(height: 48),

                          Text(
                            title!,
                            textAlign: TextAlign.center,
                            style: AppTextStyle.internal().textStyle24.copyWith(
                              color: AppColorsPallet.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],

                        if (description != null) ...[
                          const SizedBox(height: 12),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Text(
                              description!,
                              textAlign: TextAlign.center,
                              style:
                                  descriptionStyle ??
                                  AppTextStyle.internal().textStyle16.copyWith(
                                    color: AppColorsPallet.white,
                                  ),
                            ),
                          ),
                        ],

                        const SizedBox(height: 40),

                        child,

                        const Spacer(),

                        Text(
                          footerText,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.internal().textStyle16.copyWith(
                            color: AppColorsPallet.white,
                          ),
                        ),

                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
