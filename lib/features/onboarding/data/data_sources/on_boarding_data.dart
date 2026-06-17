
import 'package:frc_app/features/onboarding/data/models/on_boarding_model.dart';

class OnboardingData {
  static const List<OnboardingModel> pages = [
    OnboardingModel(
      image: 'assets/images/on_boarding_one.png',
      title: 'Join Your \nProfessional Network',
      description:
          'Connect with professionals and companies in your industry.Build your profile, grow your network, and discover real opportunities.',
    ),
    OnboardingModel(
      image: 'assets/images/on_boarding_two.png',
      title: 'Grow Your Career\n or Your Business',
      descriptionHeader: 'For Professionals.',
      description:
          'Find the right job, develop your skills, and grow your professional network.',
    ),
    OnboardingModel(
      image: 'assets/images/on_boarding_three.png',
      title: 'Grow Your Career\n or Your Business',
      descriptionHeader: 'For Businesses.',
      description:
          'Hire talent, expand your market, and connect with suppliers and industry services.',
    ),
    OnboardingModel(
      image: 'assets/images/on_boarding_four.png',
      title: 'Smart Services for Your Industry',
      description:
          'Access marketplaces, consulting, analytics, and AI-powered insights to grow and scale your business.',
    ),
  ];
}