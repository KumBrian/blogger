import 'package:blogs_app/utils/app_utils.dart';
import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.currentPage,
    required this.totalPages,
  });

  // Current page index in the onboarding sequence
  final int currentPage;

  // Total number of pages in the onboarding sequence
  final int totalPages;

  @override
  Widget build(BuildContext context) {
    return Row(
      // Creates a list of indicators based on a fixed number (4 in this case)
      children: List.generate(4, (index) {
        return AnimatedContainer(
          // Smooth animation for width transition when page changes
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          // Active page is wider than inactive ones
          width: index == currentPage ? 30 : 10,
          height: 10,
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            // Active indicator is fully opaque, inactive is translucent
            color:
                index == currentPage
                    ? AppColors.blue
                    : AppColors.blue.withAlpha(50),
            borderRadius: BorderRadius.circular(5),
          ),
        );
      }),
    );
  }
}
