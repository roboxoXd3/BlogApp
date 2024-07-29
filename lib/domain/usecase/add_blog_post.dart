import '../entities/blog_post.dart';
import '../repository/blog_repository.dart';

class AddBlogPost {
  final BlogRepository repository;

  AddBlogPost(this.repository);

  Future<void> execute(BlogPost post) async {
    await repository.addBlogPost(post);
  }
}
