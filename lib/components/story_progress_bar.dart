import 'package:flutter/material.dart';

class StoryProgressBar extends StatefulWidget {
  const StoryProgressBar({super.key, required this.animationController});

  final AnimationController animationController;

  @override
  State<StoryProgressBar> createState() => _StoryProgressBarState();
}

class _StoryProgressBarState extends State<StoryProgressBar>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;

  @override
  initState() {
    super.initState();

    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: widget.animationController, curve: Curves.linear),
    );
    widget.animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return SizedBox(
          width: size.width * 0.8,
          child: LinearProgressIndicator(
            backgroundColor: const Color.fromARGB(85, 255, 255, 255),
            minHeight: 5,

            color: Colors.white,

            borderRadius: BorderRadius.circular(20),
            value: animation.value,
          ),
        );
      },
    );
  }
}
