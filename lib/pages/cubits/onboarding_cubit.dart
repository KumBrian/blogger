import 'package:bloc/bloc.dart';
import 'package:blogs_app/models/onboarding_page_model.dart';

// Cubit that manages the onboarding flow state
class OnboardingCubit extends Cubit<int> {
  // Initializes the cubit with the first onboarding page index (0)
  OnboardingCubit() : super(0);

  // List of onboarding pages to display
  final List<OnboardingPageModel> pages = [
    OnboardingPageModel(
      title: 'Read the article you want instantly',
      description:
          'You can read thousands of articles on Blog Club, save them in the application and share them with your loved ones.',
      imageUrl: 'assets/illustrations/workspace.svg',
    ),
    OnboardingPageModel(
      title: 'Discover new stories every day',
      description:
          'Get personalized recommendations and enjoy fresh content every day from top writers.',
      imageUrl: 'assets/illustrations/workspace2.svg',
    ),
    OnboardingPageModel(
      title: 'Share your favorite articles',
      description:
          'Easily share articles with friends and family to keep them updated with interesting reads.',
      imageUrl: 'assets/illustrations/workspace3.svg',
    ),
    OnboardingPageModel(
      title: 'Read the article you want instantly',
      description:
          'You can read thousands of articles on Blog Club, save them in the application and share them with your loved ones.',
      imageUrl: 'assets/illustrations/workspace4.svg',
    ),
  ];

  // Advances to the next onboarding page
  void nextPage() {
    if (state < pages.length - 1) {
      emit(state + 1); // Update the current page index
    }
  }

  void previousPage() {
    if (state > 0) {
      emit(state - 1);
    }
  }

  // Updates the current page index manually
  void updatePage(int index) {
    emit(index);
  }
}
