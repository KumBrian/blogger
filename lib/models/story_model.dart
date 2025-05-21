import 'package:blogger/models/user_model.dart';

class Story {
  final String id;
  final User user;
  final String title;
  final String? description;
  final String? imagePath;
  final Duration timeSincePosted;

  Story({
    required this.id,
    required this.user,
    required this.title,
    this.description,
    this.imagePath,
    required this.timeSincePosted,
  });
}
