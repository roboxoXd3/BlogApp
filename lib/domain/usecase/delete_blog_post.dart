import 'package:blog_app/domain/repository/blog_repository.dart';

class DeleteBlogPost {
  final BlogRepository repository;

  DeleteBlogPost(this.repository);

  Future<void> execute(String id) async {
    await repository.deleteBlogPost(id);
  }
}
