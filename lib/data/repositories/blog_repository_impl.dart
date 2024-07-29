import '../../domain/entities/blog_post.dart';
import '../../domain/repository/blog_repository.dart';
import '../datasources/blog_remote_data_source.dart';

class BlogRepositoryImpl implements BlogRepository {
  final BlogRemoteDataSource remoteDataSource;

  BlogRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<BlogPost>> getBlogPosts() async {
    return await remoteDataSource.getBlogPosts();
  }

  @override
  Future<void> addBlogPost(BlogPost post) async {
    await remoteDataSource.addBlogPost(post);
  }

  @override
  Future<void> deleteBlogPost(String id) async {
    await remoteDataSource.deleteBlogPost(id);
  }
}
