import '../entities/blog_post.dart';
import '../repository/blog_repository.dart';

class GetBlogPosts {
  final BlogRepository repository;

  GetBlogPosts(this.repository);

  Future<List<BlogPost>> execute() async {
    return await repository.getBlogPosts();
  }
}
