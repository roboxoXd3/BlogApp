import '../../domain/entities/blog_post.dart';

abstract class BlogRemoteDataSource {
  Future<List<BlogPost>> getBlogPosts();
  Future<void> addBlogPost(BlogPost post);
  Future<void> deleteBlogPost(String id);
}

class BlogRemoteDataSourceImpl implements BlogRemoteDataSource {
// We'll use Supabase client here, but let's not implement it yet// final SupabaseClient supabaseClient;// BlogRemoteDataSourceImpl({required this.supabaseClient});
  // final List<BlogPost> _posts = [];
  final List<BlogPost> _posts = [
    BlogPost(
      id: '1',
      title: 'First Blog Post',
      content:
          'This is the content of the first blog post. It\'s a beautiful day!',
      createdAt: DateTime.now().subtract(Duration(days: 2)),
    ),
    BlogPost(
      id: '2',
      title: 'Learning Flutter',
      content:
          'Flutter is an amazing framework for building cross-platform apps.',
      createdAt: DateTime.now().subtract(Duration(days: 1)),
    ),
    BlogPost(
      id: '3',
      title: 'Clean Architecture in Flutter',
      content:
          'Clean Architecture helps in building maintainable and scalable apps.',
      createdAt: DateTime.now(),
    ),
  ];

  @override
  Future<List<BlogPost>> getBlogPosts() async {
    // Simulate network delay
    await Future.delayed(
      const Duration(seconds: 1),
    );
    return _posts;
  }

  @override
  Future<void> addBlogPost(BlogPost post) async {
    // Simulate network delay
    // ignore: prefer_const_constructors
    await Future.delayed(
      const Duration(seconds: 1),
    );
    _posts.add(post);
  }

  @override
  Future<void> deleteBlogPost(String id) async {
    // TODO: implement deleteBlogPost
    // throw UnimplementedError();
    Future.delayed(const Duration(seconds: 1));
    _posts.removeWhere((post) => post.id == id);
  }
}
