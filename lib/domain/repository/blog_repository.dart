import '../entities/blog_post.dart';

abstract class BlogRepository {
  Future<List<BlogPost>> getBlogPosts();
  Future<void> addBlogPost(BlogPost post);
  Future<void> deleteBlogPost(String id);
}
