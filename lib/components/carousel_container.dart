import 'package:blogger/utils/app_utils.dart';
import 'package:flutter/material.dart';

class CarouselContainer extends StatelessWidget {
  const CarouselContainer({super.key, required this.size, required this.index});

  final Size size;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size.width * 0.6,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/carousel${index + 1}.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: size.width * 0.6,
            height: size.height * 0.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withValues(alpha: 1),
                  Colors.black.withValues(alpha: 0.7),
                  Colors.black.withValues(alpha: 0.3),
                  Colors.black.withValues(alpha: 0),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Technology',
                  style: AppFont.black.copyWith(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
