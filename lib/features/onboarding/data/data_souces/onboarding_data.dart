import '../../../../core/utils/assets.dart';
import '../models/onboarding_model.dart';

final List<OnboardingModel> onboardingData = [
  OnboardingModel(
      imagePath: AppAssets.books,
      title: 'Explore a World of Free Books',
      subtitle:
          'Find and read thousands of free books from various genres. Start your reading journey today!'),
  OnboardingModel(
      imagePath: AppAssets.onShelfBooks,
      title: 'Track Your Reading Progress',
      subtitle:
          ' Organize books into shelves—Want to Read, Reading, and Finished. Stay on top of your reading goals!'),
  OnboardingModel(
      imagePath: AppAssets.openBook,
      title: 'Books Just for You',
      subtitle:
          'Select your favorite genres and get personalized book suggestions tailored just for you!'),
];
