import 'package:blogger/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class StoryScreen extends StatelessWidget {
  const StoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Column(
        children: [
          Container(
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
                  top: 20,
                  left: 20,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Text(
                    'The Story of\nThe World',
                    style: AppFont.black.copyWith(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
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
                      style: AppFont.medium.copyWith(
                        color: AppColors.darkBlueText,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
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
            ],
          ),
        ],
      ),
    );
  }
}
