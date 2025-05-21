import 'package:blogger/components/carousel_container.dart';
import 'package:blogger/components/news_box.dart';
import 'package:blogger/components/story_widget.dart';
import 'package:blogger/data/sample_data.dart';
import 'package:blogger/models/article_model.dart';
import 'package:blogger/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

import '../models/story_model.dart';
import '../models/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int itemIndex = 0;
  List<Story> stories = [];
  List<Article> articles = [];

  @override
  void initState() {
    super.initState();
    stories = generateSampleStories();
    List<User> users = sampleUsers;
    articles = [
      Article(
        user: users[0],
        articleTitle: 'The Future of Tech',
        articleDescription: 'Exploring the upcoming trends in technology...',
        timeSincePosted: Duration(hours: 2),
        imagePath: 'assets/images/article1.jpg',
      ),
      Article(
        user: users[1],
        articleTitle: 'Productivity Hacks for Developers',
        articleDescription: 'Simple yet effective ways to stay productive...',
        timeSincePosted: Duration(days: 1, hours: 3),
        imagePath: 'assets/images/article2.jpg',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actionsPadding: const EdgeInsets.only(right: 45),
        scrolledUnderElevation: 0,

        elevation: 0,

        title: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text('Hi, Jonathan', style: AppFont.medium),
        ),
        actions: [
          IconButton(
            icon: Badge(
              alignment: Alignment.topLeft,
              smallSize: 12,
              largeSize: 16,
              child: Icon(HugeIcons.strokeRoundedNotification01, size: 30),
            ),
            onPressed: () {
              // Handle notification action
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 20),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Text(
              'Explore Today\'s',
              style: AppFont.black.copyWith(fontSize: 24),
            ),
          ),
          SizedBox(
            height: size.height * 0.12,
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 5, left: 40),
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: stories.length,
              itemBuilder: (context, index) {
                return StoryWidget(
                  story: stories[index],
                  isViewed: index % 2 == 0 ? true : false,
                  size: size,
                );
              },
            ),
          ),
          SizedBox(
            height: size.height * 0.35,
            child: Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: CarouselView(
                padding: const EdgeInsets.only(right: 20),
                itemExtent: size.width * 0.65,
                elevation: 0,
                shrinkExtent: size.width * 0.2,
                itemSnapping: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                children: List.generate(3, (index) {
                  return CarouselContainer(size: size, index: index);
                }),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 45, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Latest News',
                  style: AppFont.black.copyWith(fontSize: 20),
                ),
                TextButton(
                  onPressed: () {},

                  child: Text(
                    'More',
                    style: AppFont.roman.copyWith(
                      fontSize: 20,
                      color: AppColors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: List.generate(articles.length, (index) {
              return InkWell(
                onTap: () {
                  // Handle article tap
                  context.go('/home/article', extra: articles[index]);
                },
                child: NewsBox(size: size),
              );
            }),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle new article action
        },
        elevation: 0,
        shape: CircleBorder(),
        backgroundColor: AppColors.blue,
        child: const Icon(Icons.add_rounded, size: 40, color: Colors.white),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: itemIndex,
        onTap: (index) {
          setState(() {
            itemIndex = index;
          });
        },
        iconSize: 30,
        selectedItemColor: AppColors.blue,
        unselectedItemColor: AppColors.darkBlue,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedHome01,
              color: itemIndex == 0 ? AppColors.blue : AppColors.darkBlue,
            ),
            label: 'Home',
            tooltip: 'Home',
          ),
          BottomNavigationBarItem(
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedBook02,
              color: itemIndex == 1 ? AppColors.blue : AppColors.darkBlue,
            ),
            label: 'Article',
            tooltip: 'Article',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.add, size: 0), label: ''),
          BottomNavigationBarItem(
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedSearch01,
              color: itemIndex == 3 ? AppColors.blue : AppColors.darkBlue,
            ),
            label: 'Search',
            tooltip: 'Search',
          ),
          BottomNavigationBarItem(
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedMenuCircle,
              color: itemIndex == 4 ? AppColors.blue : AppColors.darkBlue,
            ),
            label: 'Menu',
            tooltip: 'Menu',
          ),
        ],
      ),
    );
  }
}
