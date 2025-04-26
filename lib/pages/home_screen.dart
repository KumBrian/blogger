import 'package:blogger/components/carousel_container.dart';
import 'package:blogger/components/story_widget.dart';
import 'package:blogger/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int itemIndex = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actionsPadding: const EdgeInsets.only(right: 45),

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
      body: SingleChildScrollView(
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Text(
                'Explore Today\'s',
                style: AppFont.black.copyWith(fontSize: 24),
              ),
            ),
            SizedBox(
              height: size.height * 0.15,
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 5, left: 40),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return StoryWidget(
                    index: index,
                    isViewed: index % 2 == 0 ? true : false,
                  );
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.35,
              child: CarouselView(
                padding: const EdgeInsets.only(left: 40),
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
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 45, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Latest News',
                    style: AppFont.black.copyWith(fontSize: 24),
                  ),
                  TextButton(
                    onPressed: () {},

                    child: Text(
                      'More',
                      style: AppFont.roman.copyWith(
                        fontSize: 24,
                        color: AppColors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.25,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 40),
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          height: size.height * 0.15,
                          width: size.width * 0.3,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage('assets/images/carousel1.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
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
                                      fontSize: 18,
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
                                      fontSize: 18,
                                      color: AppColors.darkBlue,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.bookmark_rounded,
                                      size: 18,
                                    ),

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
                },
              ),
            ),
          ],
        ),
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
