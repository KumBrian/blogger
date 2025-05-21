import 'package:blogger/extensions/extensions.dart';
import 'package:blogger/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

import '../models/article_model.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key, required this.article});
  final Article article;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz, size: 40),
            onPressed: () {
              // Handle notification action
            },
          ),
        ],
        actionsPadding: const EdgeInsets.only(right: 40),
        leadingWidth: 100,
        leading: IconButton(
          icon: const Icon(HugeIcons.strokeRoundedArrowLeft01, size: 40),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  article.articleTitle.toTitleCase,
                  style: AppFont.black.copyWith(
                    fontSize: 36,
                    color: AppColors.darkBlue,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Row(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage('assets/images/category1.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      spacing: 10,

                      children: [
                        Text(
                          article.user.name.toTitleCase,
                          style: AppFont.medium.copyWith(
                            color: AppColors.darkBlueText,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '${article.timeSincePosted.inMinutes}m ago',
                          style: AppFont.light.copyWith(
                            color: AppColors.darkGrey,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: size.width * 0.1),

                    IconButton(
                      icon: const Icon(
                        HugeIcons.strokeRoundedTelegram,
                        size: 30,
                      ),
                      color: AppColors.blue,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(
                        HugeIcons.strokeRoundedBookmark02,
                        size: 30,
                      ),
                      color: AppColors.blue,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: size.height * 0.3,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/article.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 40,
                ),
                child: Text(
                  article.articleDescription.toTitleCase,
                  style: AppFont.heavy.copyWith(
                    fontSize: 28,
                    color: AppColors.darkBlue,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 40,
                  right: 40,
                  bottom: size.height * 0.12,
                ),
                child: Text(
                  "This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex. This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.",
                  style: AppFont.roman.copyWith(
                    fontSize: 20,
                    color: AppColors.darkBlueText,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: IgnorePointer(
              child: Container(
                width: size.width,
                height: size.height * 0.25,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.white.withValues(alpha: 1),
                      Colors.white.withValues(alpha: 0.8),
                      Colors.white.withValues(alpha: 0.4),
                      Colors.white.withValues(alpha: 0),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.blue,
        onPressed: () {},
        label: Row(
          spacing: 5,
          children: [
            const Icon(
              HugeIcons.strokeRoundedThumbsUp,
              size: 20,
              color: Colors.white,
            ),
            const SizedBox(width: 5),
            Text(
              '${article.likes}',
              style: AppFont.roman.copyWith(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
