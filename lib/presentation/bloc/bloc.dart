import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/add_blog_post.dart';
import '../../domain/usecase/delete_blog_post.dart';
import '../../domain/usecase/get_blog_posts.dart';
import 'blog_event.dart';
import 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final GetBlogPosts getBlogPosts;
  final AddBlogPost addBlogPost;
  final DeleteBlogPost deleteBlogPost;

  BlogBloc(
      {required this.getBlogPosts,
      required this.addBlogPost,
      required this.deleteBlogPost})
      : super(BlogInitial()) {
    on<GetBlogPostsEvent>(_onGetBlogPosts);
    on<AddBlogPostEvent>(_onAddBlogPost);
    on<DeleteBlogPostEvent>(_onDeleteBlogPost);
  }

  Future<void> _onGetBlogPosts(
      GetBlogPostsEvent event, Emitter<BlogState> emit) async {
    emit(BlogLoading());
    try {
      final posts = await getBlogPosts.execute();
      emit(BlogLoaded(posts));
    } catch (e) {
      emit(BlogError('Failed to fetch blog posts'));
    }
  }

  Future<void> _onAddBlogPost(
      AddBlogPostEvent event, Emitter<BlogState> emit) async {
    emit(BlogLoading());
    try {
      await addBlogPost.execute(event.post);
      final posts = await getBlogPosts.execute();
      emit(BlogLoaded(posts));
    } catch (e) {
      emit(BlogError('Failed to add blog post'));
    }
  }

  FutureOr<void> _onDeleteBlogPost(
      DeleteBlogPostEvent event, Emitter<BlogState> emit) async {
    emit(BlogLoading());
    try {
      await deleteBlogPost.execute(event.id);
      final posts = await getBlogPosts.execute();
      emit(BlogLoaded(posts));
    } catch (e) {
      emit(BlogError('Failed to delete blog post'));
    }
  }
}
