import '../../domain/entities/onboarding_entity.dart';

class OnboardingModel extends OnboardingEntity {
  const OnboardingModel({
    required super.image,
    required super.title,
    required super.description,
    super.descriptionHeader,
  });
}