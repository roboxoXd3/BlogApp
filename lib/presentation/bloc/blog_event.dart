import '../../domain/entities/blog_post.dart';

abstract class BlogEvent {}

class GetBlogPostsEvent extends BlogEvent {}

class AddBlogPostEvent extends BlogEvent {
  final BlogPost post;
  AddBlogPostEvent(this.post);
}

class DeleteBlogPostEvent extends BlogEvent {
  final String id;
  DeleteBlogPostEvent(this.id);
}
