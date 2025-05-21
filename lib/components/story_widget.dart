import 'package:blogger/utils/app_utils.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

import '../models/story_model.dart';

class StoryWidget extends StatelessWidget {
  const StoryWidget({
    super.key,
    required this.isViewed,
    required this.size,
    required this.story,
  });

  final Story story;
  final bool isViewed;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        InkWell(
          onTap: () {
            context.go('/home/story', extra: story);
          },
          child: Stack(
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
                          child: SizedBox(
                            height: size.height * 0.075,
                            width: size.height * 0.075,
                          ),
                        )
                        : Container(
                          height: size.height * 0.08,
                          width: size.height * 0.08,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            color: Colors.transparent,
                            border: Border.all(
                              color: AppColors.blue,
                              width: 1.5,
                            ),
                          ),
                        ),
              ),
              Positioned(
                top: 5,
                left: 10,
                child: Container(
                  height: size.height * 0.07,
                  width: size.height * 0.07,
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
                  height: size.height * 0.025,
                  width: size.height * 0.025,
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
        ),
        Text(
          '@${story.user.username}',
          style: AppFont.black.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
