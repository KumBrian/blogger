import 'package:blogs_app/components/onboarding_page.dart';
import 'package:blogs_app/components/page_indicator.dart';
import 'package:blogs_app/pages/cubits/onboarding_cubit.dart';
import 'package:blogs_app/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: BlocBuilder<OnboardingCubit, int>(
        builder: (context, currentPage) {
          final onboardingCubit = context.watch<OnboardingCubit>();
          final size = MediaQuery.of(context).size;

          return Scaffold(
            body: Padding(
              padding: EdgeInsets.only(top: size.height * 0.1),
              child: Column(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onHorizontalDragEnd: (details) {
                        if (details.primaryVelocity != null) {
                          if (details.primaryVelocity! < 0) {
                            // Swiped Left → Go Forward
                            onboardingCubit.nextPage();
                          } else if (details.primaryVelocity! > 0) {
                            // Swiped Right → Go Backward
                            onboardingCubit.previousPage();
                          }
                        }
                      },
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        transitionBuilder: (child, animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                        child: OnboardingPage(
                          key: ValueKey(currentPage),
                          page: onboardingCubit.pages[currentPage],
                          size: size,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.height * 0.05,
                        vertical: size.height * 0.03,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PageIndicator(
                            currentPage: currentPage,
                            totalPages: onboardingCubit.pages.length,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (onboardingCubit.state <
                                  onboardingCubit.pages.length - 1) {
                                onboardingCubit.nextPage();
                              } else {
                                context.go('/login');
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.blue,
                              padding: EdgeInsets.symmetric(
                                horizontal: size.height * 0.03,
                                vertical: size.height * 0.03,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Icon(
                              HugeIcons.strokeRoundedArrowRight02,
                              color: Colors.white,
                              size: 32,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
