import 'package:flutter/material.dart';
import 'package:frc_app/config/l10n/l10n_extension.dart';
import 'package:frc_app/config/theme/app_colors_pallet.dart';
import 'package:frc_app/config/theme/app_gradients.dart';
import 'package:frc_app/config/theme/app_text_style.dart';

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
        color: Colors.white,
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
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColorsPallet.assentsPurple,
                      ),
                    ),
              const Spacer(),
              Text(
                '$currentPage/$totalPages',
                style: AppTextStyle.internal().textStyle16.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColorsPallet.assentsPurple,
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
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: AppTextStyle.internal().textStyle24.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                height: 1.1,
              ),
            ),
          ),

          const SizedBox(height: 24),

          Align(
            alignment: Alignment.centerLeft,
            child: descriptionHeader != null
                ? Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '$descriptionHeader\n',
                          style: AppTextStyle.internal().textStyle16.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: AppColorsPallet.assentsGray,
                          ),
                        ),
                        TextSpan(
                          text: description,
                          style: AppTextStyle.internal().textStyle16.copyWith(
                            color: AppColorsPallet.assentsGray,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  )
                : Text(
                    description,
                    textAlign: TextAlign.left,
                    style: AppTextStyle.internal().textStyle16.copyWith(
                      color: AppColorsPallet.assentsGray,
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
                            : Colors.grey.shade300,
                        gradient: currentIndex == index
                            ? AppGradients.primaryGradient
                            : null,
                      ),
                    ),
                  ),
                ),

                if (currentIndex == 0)
                  Positioned(
                    right: 0,
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
                            style: AppTextStyle.internal().textStyle16.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColorsPallet.assentsDark,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.arrow_forward,
                            size: 18,
                            color: AppColorsPallet.assentsDark,
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
