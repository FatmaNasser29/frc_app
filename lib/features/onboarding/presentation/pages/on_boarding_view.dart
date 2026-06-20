import 'package:flutter/material.dart';
import 'package:frc_app/config/l10n/l10n_extension.dart';
import 'package:frc_app/config/routes/routes_name.dart';
import 'package:frc_app/config/theme/app_colors_pallet.dart';
import 'package:frc_app/config/theme/app_gradients.dart';
import 'package:frc_app/config/theme/app_text_style.dart';
import 'package:frc_app/features/onboarding/data/data_sources/on_boarding_data.dart';
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
      backgroundColor: const Color(0xffF5F5F8),
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
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, RoutesName.signIn);
                    },
                    child: Container(
                      width: 124,
                      height: 48,
                      decoration: BoxDecoration(
                        gradient: AppGradients.primaryGradient,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            l10n.login,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 20,
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
                style: AppTextStyle.internal().textStyle16.copyWith(
                  color: AppColorsPallet.assentsGray,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
