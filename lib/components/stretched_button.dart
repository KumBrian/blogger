import 'package:blogs_app/utils/app_utils.dart';
import 'package:flutter/material.dart';

class StretchedButton extends StatelessWidget {
  // Text label displayed on the button
  final String label;

  // Callback triggered when button is pressed
  final VoidCallback? onPressed;

  // Flag to show loading spinner instead of text
  final bool isLoading;

  const StretchedButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Make button stretch to fill available width
      width: double.infinity,
      child: ElevatedButton(
        // Disable button interaction when loading
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 18),
          backgroundColor: AppColors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          // Change color when button is disabled
          disabledBackgroundColor: AppColors.blue.withAlpha(150),
        ),
        child:
            isLoading
                // Show loading spinner if isLoading is true
                ? const CircularProgressIndicator(color: Colors.white)
                // Otherwise show label text
                : Text(
                  label,
                  style: AppFont.heavy.copyWith(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
      ),
    );
  }
}
