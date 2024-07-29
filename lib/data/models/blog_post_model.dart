import '../../domain/entities/blog_post.dart';

class BlogPostModel extends BlogPost {
  BlogPostModel({
    required super.id,
    required super.title,
    required super.content,
    required super.createdAt,
  });

  factory BlogPostModel.fromJson(Map<String, dynamic> json) {
    return BlogPostModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
