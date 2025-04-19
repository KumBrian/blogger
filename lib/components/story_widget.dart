import 'package:blogger/utils/app_utils.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class StoryWidget extends StatelessWidget {
  const StoryWidget({super.key, required this.index, required this.isViewed});

  final int index;
  final bool isViewed;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child:
                  isViewed
                      ? DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(28),
                        color: Colors.blueGrey,
                        strokeWidth: 2,
                        child: SizedBox(height: 75, width: 75),
                      )
                      : Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          color: Colors.transparent,
                          border: Border.all(color: AppColors.blue, width: 1.5),
                        ),
                      ),
            ),
            Positioned(
              top: 5,
              left: 10,
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  image: DecorationImage(
                    image: AssetImage('assets/images/category1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: AppColors.blue,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Icon(
                  HugeIcons.strokeRoundedHeartAdd,
                  size: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        Text(
          'Category ${index + 1}',
          style: AppFont.black.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
