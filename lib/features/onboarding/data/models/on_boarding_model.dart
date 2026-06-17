import 'package:frc_app/features/onboarding/domain/entities/on_boarding_entity.dart';

class OnboardingModel extends OnboardingEntity {
  const OnboardingModel({
    required super.image,
    required super.title,
    required super.description,
    super.descriptionHeader,
  });
}