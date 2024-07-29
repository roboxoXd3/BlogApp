import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc.dart';
import '../../domain/entities/blog_post.dart';
import 'package:intl/intl.dart';

import '../bloc/blog_event.dart';
import '../bloc/blog_state.dart'; // Add this import

class BlogListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Blog Posts')),
      body: BlocBuilder<BlogBloc, BlogState>(
        builder: (context, state) {
          if (state is BlogInitial) {
            BlocProvider.of<BlogBloc>(context).add(
              GetBlogPostsEvent(),
            );
            return const Center(
              child: const CircularProgressIndicator(),
            );
          } else if (state is BlogLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is BlogLoaded) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onLongPress: () {
                    _showDeleteDialog(context, state.posts[index]);
                  },
                  child: ListTile(
                    title: Text(state.posts[index].title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(state.posts[index].content),
                        const SizedBox(height: 4),
                        Text(
                          'Created on: ${DateFormat('yyyy-MM-dd – kk:mm').format(state.posts[index].createdAt)}',
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            );
          } else if (state is BlogError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final BlogPost newPost = BlogPost(
            id: DateTime.now().toString(),
            title: 'New Post ${DateTime.now()}',
            content: 'This is a new post created at ${DateTime.now()}',
            createdAt: DateTime.now(),
          );
          BlocProvider.of<BlogBloc>(context).add(AddBlogPostEvent(newPost));
        },
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, BlogPost post) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Delete Post'),
          content: Text('Are you sure you want to delete "${post.title}"?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss the dialog
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss the dialog
                // Dispatch delete event
                BlocProvider.of<BlogBloc>(context).add(
                  DeleteBlogPostEvent(post.id),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
