import 'package:blogger/models/user_model.dart';

class Article {
  final User user;
  final String articleTitle;
  final String articleDescription;
  final Duration timeSincePosted;
  final String? imagePath;
  int? likes;

  Article({
    required this.user,
    required this.articleTitle,
    required this.articleDescription,
    required this.timeSincePosted,
    required this.imagePath,
  });
}
