import 'dart:math';

import '../models/article_model.dart';
import '../models/story_model.dart';
import '../models/user_model.dart';

final random = Random();

final List<User> sampleUsers = [
  User(
    name: 'Alice Johnson',
    username: 'alicej',
    jobTitle: 'Software Engineer',
    bio: 'Passionate about technology and education.',
    profileImage: 'assets/images/profile1.jpg',
    followers: 2300,
    following: 180,
  ),
  User(
    name: 'Bob Smith',
    username: 'bobthesmith',
    jobTitle: 'Photographer',
    bio: 'Capturing life one click at a time.',
    profileImage: 'assets/images/profile2.jpg',
    followers: 1520,
    following: 320,
  ),
  User(
    name: 'Cindy Martinez',
    username: 'cindym',
    jobTitle: 'UX Designer',
    bio: 'Designing delightful user experiences.',
    profileImage: 'assets/images/profile3.jpg',
    followers: 1980,
    following: 400,
  ),
];

// Generating sample articles
List<Article> generateSampleArticles(User user) {
  return [
    Article(
      user: user,
      articleTitle: 'The Future of Tech',
      articleDescription: 'Exploring the upcoming trends in technology...',
      timeSincePosted: Duration(hours: 2),
      imagePath: 'assets/images/article1.jpg',
    ),
    Article(
      user: user,
      articleTitle: 'Productivity Hacks for Developers',
      articleDescription: 'Simple yet effective ways to stay productive...',
      timeSincePosted: Duration(days: 1, hours: 3),
      imagePath: 'assets/images/article2.jpg',
    ),
  ];
}

// Assign articles to users
void assignArticlesToUsers() {
  for (var user in sampleUsers) {
    user.articles = generateSampleArticles(user);
  }
}

// Generating sample stories
List<Story> generateSampleStories() {
  return [
    Story(
      id: 'story1',
      user: sampleUsers[0],
      title: 'Morning Walk',
      description: 'A beautiful sunrise in the city.',
      imagePath: 'assets/images/story1.jpg',
      timeSincePosted: Duration(hours: 3),
    ),
    Story(
      id: 'story2',
      user: sampleUsers[1],
      title: 'Studio Life',
      description: 'Behind the scenes of a photo shoot.',
      imagePath: 'assets/images/story2.jpg',
      timeSincePosted: Duration(hours: 6, minutes: 20),
    ),
    Story(
      id: 'story3',
      user: sampleUsers[2],
      title: 'UX Workshop',
      description: 'Sketching out the new flow...',
      imagePath: 'assets/images/story3.jpg',
      timeSincePosted: Duration(days: 1, hours: 2),
    ),
    Story(
      id: 'story4',
      user: sampleUsers[0],
      title: 'Coffee Break',
      description: 'Taking a moment to recharge.',
      imagePath: 'assets/images/story4.jpg',
      timeSincePosted: Duration(minutes: 45),
    ),
  ];
}
