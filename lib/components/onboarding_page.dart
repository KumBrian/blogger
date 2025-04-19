import 'package:blogger/models/onboarding_page_model.dart';
import 'package:blogger/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingPageModel page;
  final Size size;

  const OnboardingPage({super.key, required this.page, required this.size});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: SizedBox(
            width: size.width * 0.8,
            child: SvgPicture.asset(
              page.imageUrl,
              semanticsLabel: page.title,
              placeholderBuilder:
                  (BuildContext context) => Container(
                    width: size.width * 0.8,
                    height: size.height * 0.4,
                    color: Colors.grey.shade200,
                    child: const Center(child: CircularProgressIndicator()),
                  ),
              fit: BoxFit.contain,
              width: size.width * 0.8,
              height: size.height * 0.4,
            ),
          ),
        ),
        SizedBox(height: size.height * 0.05),
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withAlpha(30),
                  spreadRadius: 1,
                  blurRadius: 15,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.height * 0.05,
                vertical: size.height * 0.03,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    page.title,
                    style: AppFont.heavy.copyWith(
                      fontSize: 32,
                      color: AppColors.darkBlue,
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    page.description,
                    style: AppFont.book.copyWith(
                      fontSize: 18,
                      color: AppColors.darkBlueText,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
