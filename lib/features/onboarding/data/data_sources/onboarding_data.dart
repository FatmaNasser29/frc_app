import 'package:frc_app/features/onboarding/data/models/onboarding_model.dart';
import 'package:frc_app/l10n/app_localizations.dart';

class OnboardingData {
  static List<OnboardingModel> pages(AppLocalizations l10n) => [
    OnboardingModel(
      image: 'assets/images/on_boarding_one.png',
      title: l10n.onboardingPage1Title,
      description: l10n.onboardingPage1Description,
    ),
    OnboardingModel(
      image: 'assets/images/on_boarding_two.png',
      title: l10n.onboardingPage2Title,
      descriptionHeader: l10n.onboardingPage2DescriptionHeader,
      description: l10n.onboardingPage2Description,
    ),
    OnboardingModel(
      image: 'assets/images/on_boarding_three.png',
      title: l10n.onboardingPage3Title,
      descriptionHeader: l10n.onboardingPage3DescriptionHeader,
      description: l10n.onboardingPage3Description,
    ),
    OnboardingModel(
      image: 'assets/images/on_boarding_four.png',
      title: l10n.onboardingPage4Title,
      description: l10n.onboardingPage4Description,
    ),
  ];
}
