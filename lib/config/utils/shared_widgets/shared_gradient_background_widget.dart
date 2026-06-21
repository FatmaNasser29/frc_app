import 'package:flutter/material.dart';
import 'package:frc_app/config/l10n/l10n_extension.dart';
import 'package:frc_app/config/theme/app_theme.dart';

class AuthGradientBackground extends StatelessWidget {
  final Widget child;
  final String? title;
  final String? description;
  final String? footerText;
  final TextStyle? descriptionStyle;
  final VoidCallback? onBackPressed;

  const AuthGradientBackground({
    super.key,
    required this.child,
    this.title,
    this.description,
    this.descriptionStyle,
    this.footerText,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(gradient: context.gradients.reverseGradient),
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
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              if (Navigator.canPop(context))
                                Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      start: 16,
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.arrow_back_ios_new,
                                        color: Colors.white,
                                        size: 24,
                                        textDirection: Directionality.of(context),
                                      ),
                                      onPressed:
                                          onBackPressed ??
                                          () => Navigator.of(context).pop(),
                                    ),
                                  ),
                                ),
                              Center(
                                child: SizedBox(
                                  height: 64,
                                  width: 166,
                                  child: Image.asset(
                                    'assets/images/frc_logo.png',
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 22),

                        Text(
                          l10n.fashionIndustryNetwork,
                          style: context.textStyle.textStyle16.copyWith(
                            color: Colors.white,
                          ),
                        ),

                        if (title != null) ...[
                          const SizedBox(height: 48),

                          Text(
                            title!,
                            textAlign: TextAlign.center,
                            style: context.textStyle.textStyle24.copyWith(
                              color: Colors.white,
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
                                  context.textStyle.textStyle16.copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        ],

                        const SizedBox(height: 40),

                        child,

                        const Spacer(),

                        Text(
                          footerText ?? l10n.connectWithProfessionalsLocally,
                          textAlign: TextAlign.center,
                          style: context.textStyle.textStyle16.copyWith(
                            color: Colors.white,
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
