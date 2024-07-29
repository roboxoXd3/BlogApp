import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/bloc/bloc.dart';
import 'presentation/pages/blog_list_page.dart';
import 'injection_container.dart' as di;

void main() async {
  print('Starting main');
  WidgetsFlutterBinding.ensureInitialized();
  print('About to initialize dependencies');
  await di.init();
  print('Dependencies initialized, running app');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        // we are using di.sl<BlogBloc>() because we are using the service locator and we have registered the BlogBloc inside the service locator in injection_container.dart.
        create: (_) => di.sl<BlogBloc>(),
        child: BlogListPage(),
      ),
    );
  }
}
