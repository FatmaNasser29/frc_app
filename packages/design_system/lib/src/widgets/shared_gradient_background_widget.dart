import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import '../theme/app_theme.dart';

class AuthGradientBackground extends StatelessWidget {
  final Widget child;
  final String? title;
  final TextStyle? titleStyle;
  final TextAlign titleAlign;
  final String? subtitle;
  final TextStyle? subtitleStyle;
  final TextAlign subtitleAlign;
  final String? description;
  final String? footerText;
  final TextStyle? descriptionStyle;
  final TextAlign descriptionAlign;
  final TextStyle? footerStyle;
  final VoidCallback? onBackPressed;
  final String logoPath;
  final Widget? logo;
  final double logoHeight;
  final double logoWidth;
  final Color? logoColor;
  final bool showLogo;
  final bool showBackButton;

  const AuthGradientBackground({
    super.key,
    required this.child,
    this.title,
    this.titleStyle,
    this.titleAlign = TextAlign.center,
    this.subtitle,
    this.subtitleStyle,
    this.subtitleAlign = TextAlign.center,
    this.description,
    this.descriptionStyle,
    this.descriptionAlign = TextAlign.center,
    this.footerStyle,
    this.footerText,
    this.onBackPressed,
    this.logoPath = 'assets/images/frc_logo.png',
    this.logo,
    this.logoHeight = 64,
    this.logoWidth = 166,
    this.logoColor = Colors.white,
    this.showLogo = true,
    this.showBackButton = true,
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
                              if (showBackButton && Navigator.canPop(context))
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
                                        textDirection: Directionality.of(
                                          context,
                                        ),
                                      ),
                                      onPressed:
                                          onBackPressed ??
                                          () => Navigator.of(context).pop(),
                                    ),
                                  ),
                                ),
                              if (showLogo)
                                Center(
                                  child:
                                      logo ??
                                      Container(
                                        constraints: BoxConstraints(
                                          maxHeight: logoHeight == 64
                                              ? MediaQuery.of(
                                                      context,
                                                    ).size.height *
                                                    0.08
                                              : logoHeight,
                                          maxWidth: logoWidth == 166
                                              ? MediaQuery.of(
                                                      context,
                                                    ).size.width *
                                                    0.45
                                              : logoWidth,
                                        ),
                                        child: ClipRect(
                                          clipper: const BottomLogoClipper(),
                                          child: ColorFiltered(
                                            colorFilter: ColorFilter.mode(
                                              logoColor ?? Colors.white,
                                              BlendMode.srcIn,
                                            ),
                                            child: Image.asset(
                                              logoPath,
                                              filterQuality: FilterQuality.high,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ),
                                ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 22),

                        Text(
                          subtitle ?? l10n.fashionIndustryNetwork,
                          textAlign: subtitleAlign,
                          style:
                              subtitleStyle ??
                              context.textStyle.textStyle16.copyWith(
                                color: Colors.white,
                              ),
                        ),

                        if (title != null) ...[
                          const SizedBox(height: 48),

                          Text(
                            title!,
                            textAlign: titleAlign,
                            style:
                                titleStyle ??
                                context.textStyle.textStyle24.copyWith(
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
                              textAlign: descriptionAlign,
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
                          style:
                              footerStyle ??
                              context.textStyle.textStyle16.copyWith(
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

class BottomLogoClipper extends CustomClipper<Rect> {
  const BottomLogoClipper();

  @override
  Rect getClip(Size size) {
    // Clip 2 pixels off the bottom edge to clear any sub-pixel rendering line bleed
    return Rect.fromLTRB(0, 0, size.width, size.height - 2.0);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}
