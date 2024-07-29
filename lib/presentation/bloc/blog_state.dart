import '../../domain/entities/blog_post.dart';

abstract class BlogState {}

class BlogInitial extends BlogState {}

class BlogLoading extends BlogState {}

class BlogLoaded extends BlogState {
  final List<BlogPost> posts;
  BlogLoaded(this.posts);
}

class BlogError extends BlogState {
  final String message;
  BlogError(this.message);
}
