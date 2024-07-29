import 'package:blog_app/domain/usecase/delete_blog_post.dart';
import 'package:get_it/get_it.dart';
import 'data/datasources/blog_remote_data_source.dart';
import 'data/repositories/blog_repository_impl.dart';
import 'domain/repository/blog_repository.dart';
import 'domain/usecase/add_blog_post.dart';
import 'domain/usecase/get_blog_posts.dart';
import 'presentation/bloc/bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  print('Initializing dependencies');
  // Bloc
  sl.registerFactory(() =>
      BlogBloc(getBlogPosts: sl(), addBlogPost: sl(), deleteBlogPost: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetBlogPosts(sl()));
  sl.registerLazySingleton(() => AddBlogPost(sl()));
  sl.registerLazySingleton(() => DeleteBlogPost(sl()));

  // Repository
  sl.registerLazySingleton<BlogRepository>(
    () => BlogRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<BlogRemoteDataSource>(
    () => BlogRemoteDataSourceImpl(),
  );

  print('Dependencies initialized');
}
