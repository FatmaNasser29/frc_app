import 'package:flutter/material.dart';
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
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
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
    itemCount: OnboardingData.pages.length,
    onPageChanged: (index) {
      setState(() {
        currentIndex = index;
      });
    },
    itemBuilder: (_, index) {
      final item = OnboardingData.pages[index];

      return OnboardingCard(
        image: item.image,
        title: item.title,
        description: item.description,
        descriptionHeader: item.descriptionHeader,
        currentPage: index + 1,
        totalPages: OnboardingData.pages.length,
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
          if (currentIndex < OnboardingData.pages.length - 1) {
            _controller.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          } else {
            // Navigate to Login
          }
        },
      );
    },
  ),
),
            

             Padding(
              padding: EdgeInsets.all(23),
              child: Text(
                'Connect with top professionals locally',
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