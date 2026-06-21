import 'package:flutter/material.dart';
import 'package:frc_app/config/l10n/l10n_extension.dart';
import 'package:frc_app/config/routes/routes_name.dart';
import 'package:frc_app/config/theme/app_theme.dart';
import 'package:frc_app/features/onboarding/data/data_sources/onboarding_data.dart';
import 'package:frc_app/features/onboarding/presentation/widgets/reusable_card_widget.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _controller = PageController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final pages = OnboardingData.pages(l10n);

    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/frc_logo.png',
                    height: 40,
                    color: context.isDarkMode ? Colors.white : null,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        RoutesName.signIn,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        gradient: context.gradients.primaryGradient,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            currentIndex == 3 ? l10n.login : l10n.skipToLogin,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            Icons.arrow_forward,
                            size: 18,
                            color: Colors.white,
                            textDirection: Directionality.of(context),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, index) {
                  final item = pages[index];

                  return OnboardingCard(
                    image: item.image,
                    title: item.title,
                    description: item.description,
                    descriptionHeader: item.descriptionHeader,
                    currentPage: index + 1,
                    totalPages: pages.length,
                    controller: _controller,
                    currentIndex: currentIndex,
                    onBack: () {
                      if (currentIndex > 0) {
                        _controller.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    onNext: () {
                      if (currentIndex < pages.length - 1) {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(23),
              child: Text(
                l10n.connectWithProfessionalsLocally,
                style: context.textStyle.textStyle16.copyWith(
                  color: context.colors.assentsGray,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
