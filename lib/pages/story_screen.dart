import 'dart:async';
import 'dart:ui';

import 'package:blogger/components/story_progress_bar.dart';
import 'package:blogger/extensions/extensions.dart';
import 'package:blogger/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

import '../models/story_model.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key, required this.story});

  final Story story;

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen>
    with SingleTickerProviderStateMixin {
  Stopwatch stopwatch = Stopwatch();
  Duration? elapsedTime;

  @override
  void initState() {
    super.initState();

    progressAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 15000),
    );

    progressAnimationController.addListener(() {
      if (progressAnimationController.status == AnimationStatus.completed) {
        _navigateToHome();
      }
    });
  }

  @override
  void dispose() {
    progressAnimationController.stop();
    super.dispose();
    progressAnimationController.dispose();
  }

  void _navigateToHome() async {
    if (mounted) {
      context.pop();
    }
  }

  late AnimationController progressAnimationController;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Column(
        children: [
          GestureDetector(
            onVerticalDragUpdate: (details) {
              if (details.delta.dy > 0) {
                debugPrint('Swipping Down');
              }
            },
            onVerticalDragEnd: (details) {
              if (details.primaryVelocity! > 0) {
                debugPrint('Swipping Down');
                progressAnimationController.stop();
                context.pop();
              }
            },
            onLongPressStart: (details) {
              Future.delayed(Duration(milliseconds: 1000));
              setState(() {
                progressAnimationController.stop();
                stopwatch.start();
                debugPrint(
                  'Stopwatch Started: ${stopwatch.elapsed.inMilliseconds}ms',
                );
              });
            },
            onLongPressEnd: (details) {
              Future.delayed(Duration(milliseconds: 2000));
              setState(() {
                progressAnimationController.forward();
                stopwatch.stop();
                debugPrint(
                  'Stopwatch Stopped: ${stopwatch.elapsed.inMilliseconds}ms',
                );
                elapsedTime = stopwatch.elapsed;
                progressAnimationController.duration =
                    progressAnimationController.duration! + elapsedTime!;
                stopwatch.reset();
              });
            },
            child: Container(
              width: double.infinity,
              height: size.height * 0.85,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/story.png'),

                  fit: BoxFit.cover,
                ),
                color: AppColors.darkBlueText,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    child: Container(
                      width: size.width,
                      height: size.height * 0.4,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withValues(alpha: 0.6),
                            Colors.black.withValues(alpha: 0.4),
                            Colors.black.withValues(alpha: 0.2),
                            Colors.black.withValues(alpha: 0),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: size.width,
                      height: size.height * 0.35,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withValues(alpha: 0.6),
                            Colors.black.withValues(alpha: 0.4),
                            Colors.black.withValues(alpha: 0.2),
                            Colors.black.withValues(alpha: 0),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 40.0,
                      horizontal: 40,
                    ),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: StoryProgressBar(
                        animationController: progressAnimationController,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 70,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/category1.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                widget.story.user.name.toTitleCase,
                                style: AppFont.heavy.copyWith(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                '${widget.story.timeSincePosted.inMinutes}m '
                                'ago',
                                style: AppFont.light.copyWith(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: size.width * 0.2),

                          IconButton(
                            icon: const Icon(Icons.close_rounded, size: 45),
                            color: Colors.white,
                            onPressed: () {
                              progressAnimationController.stop();
                              context.pop();
                              debugPrint('Pop to Home');
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),

                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 20,
                            ),
                            width: size.width * 0.8,
                            height: size.height * 0.36,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.story.title.toTitleCase,
                                  style: AppFont.heavy.copyWith(
                                    color: Colors.white,
                                    fontSize: 24,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                widget.story.description == null
                                    ? SizedBox()
                                    : Text(
                                      widget.story.description!,
                                      style: AppFont.medium.copyWith(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Icon(HugeIcons.strokeRoundedArrowUp01, color: Colors.white),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                      child: Text(
                        'Read More',
                        style: AppFont.heavy.copyWith(
                          color: AppColors.darkBlueText,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.favorite_rounded,
                        color: Color(0xffFF3743),
                        size: 35,
                      ),

                      Text(
                        '450k',
                        style: AppFont.roman.copyWith(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
