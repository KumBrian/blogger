import 'package:flutter/material.dart';

// A reusable image button widget that triggers a callback on tap
class ImageButton extends StatelessWidget {
  const ImageButton({super.key, required this.image, required this.onTap});

  final String image; // Image name (without extension or path)
  final VoidCallback onTap; // Callback to execute when tapped

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Get screen size
    return InkWell(
      onTap: onTap, // Handle tap interaction
      child: Image.asset(
        'assets/images/$image.png', // Load image from assets
        width: size.width * 0.1, // Set image width
      ),
    );
  }
}
