import 'article_model.dart';

class User {
  final String name;
  final String username;
  String? jobTitle;
  String? bio;
  String? profileImage;
  List<Article>? articles;
  int? followers;
  int? following;

  User({
    this.jobTitle,
    this.bio,
    this.profileImage,
    this.articles,
    this.followers,
    this.following,
    required this.name,
    required this.username,
  });
}
