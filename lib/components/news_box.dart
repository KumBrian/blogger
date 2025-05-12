import 'package:blogger/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class NewsBox extends StatelessWidget {
  const NewsBox({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: size.height * 0.25,
            width: size.width * 0.3,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage('assets/images/carousel1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: size.width * 0.03),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Big Data'.toUpperCase(),
                  style: AppFont.medium.copyWith(
                    fontSize: 18,
                    color: AppColors.blue,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Why Big Data needs Thick Data',
                  style: AppFont.roman.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    const Icon(
                      HugeIcons.strokeRoundedThumbsUp,
                      size: 18,
                      color: AppColors.darkBlue,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '2.1k',
                      style: AppFont.roman.copyWith(
                        fontSize: 14,
                        color: AppColors.darkBlue,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.access_time_rounded,
                      size: 18,
                      color: AppColors.darkBlue,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '1hr ago',
                      style: AppFont.roman.copyWith(
                        fontSize: 14,
                        color: AppColors.darkBlue,
                      ),
                    ),
                    const SizedBox(width: 5),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.bookmark_rounded, size: 18),

                      color: AppColors.blue,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
