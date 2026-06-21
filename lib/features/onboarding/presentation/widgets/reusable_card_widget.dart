import 'package:flutter/material.dart';
import 'package:frc_app/config/l10n/l10n_extension.dart';
import 'package:frc_app/config/theme/app_theme.dart';

class OnboardingCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final int currentPage;
  final int totalPages;
  final PageController controller;
  final int currentIndex;
  final VoidCallback onNext;
  final VoidCallback onBack;
  final String? descriptionHeader;

  const OnboardingCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    this.descriptionHeader,
    required this.currentPage,
    required this.totalPages,
    required this.controller,
    required this.currentIndex,
    required this.onNext,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Row(
            children: [
              currentIndex == 0
                  ? const SizedBox(width: 48)
                  : IconButton(
                      onPressed: onBack,
                      icon: Icon(
                        Directionality.of(context) == TextDirection.rtl
                            ? Icons.arrow_forward
                            : Icons.arrow_back,
                        color: context.colors.assentsPurple,
                      ),
                    ),
              const Spacer(),
              Text(
                '$currentPage/$totalPages',
                style: context.textStyle.textStyle16.copyWith(
                  fontWeight: FontWeight.w700,
                  color: context.colors.assentsPurple,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          Expanded(
            flex: 4,
            child: SizedBox(
              height: 164,
              width: 164,
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),
          ),

          const SizedBox(height: 24),

          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              title,
              textAlign: TextAlign.start,
              style: context.textStyle.textStyle24.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                height: 1.1,
              ),
            ),
          ),

          const SizedBox(height: 24),

          Align(
            alignment: AlignmentDirectional.centerStart,
            child: descriptionHeader != null
                ? Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '$descriptionHeader\n',
                          style: context.textStyle.textStyle16.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: context.colors.assentsGray,
                          ),
                        ),
                        TextSpan(
                          text: description,
                          style: context.textStyle.textStyle16.copyWith(
                            color: context.colors.assentsGray,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.start,
                  )
                : Text(
                    description,
                    textAlign: TextAlign.start,
                    style: context.textStyle.textStyle16.copyWith(
                      color: context.colors.assentsGray,
                      height: 1.6,
                    ),
                  ),
          ),

          const Spacer(),

          SizedBox(
            height: 40,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    totalPages,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: currentIndex == index ? 24 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: currentIndex == index
                            ? null
                            : context.colors.backgroundSecondary.withValues(alpha: .5),
                        gradient: currentIndex == index
                            ? context.gradients.primaryGradient
                            : null,
                      ),
                    ),
                  ),
                ),

                if (currentIndex < totalPages - 1)
                  PositionedDirectional(
                    end: 0,
                    child: TextButton(
                      onPressed: onNext,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            l10n.next,
                            style: context.textStyle.textStyle16.copyWith(
                              fontWeight: FontWeight.w600,
                              color: context.colors.assentsDark,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(
                            Directionality.of(context) == TextDirection.rtl
                                ? Icons.arrow_back
                                : Icons.arrow_forward,
                            size: 18,
                            color: context.colors.assentsDark,
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
