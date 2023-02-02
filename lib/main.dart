import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/assets/theme.dart';
import 'package:todo_app/screens/cubit/notes_create_cubit.dart';
import 'package:todo_app/screens/cubit/notes_detail_cubit.dart';
import 'package:todo_app/screens/cubit/notes_display_cubit.dart';
import 'package:todo_app/screens/cubit/profile_photo_cubit.dart';
import 'package:todo_app/screens/cubit/username_cubit.dart';
import 'package:todo_app/screens/homepage_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProfilePageCubit()),
        BlocProvider(create: (context) => UserNameCubit()),
        BlocProvider(create: (context) => NotesDisplayCubit()),
        BlocProvider(create: (context) => NotesDetailCubit()),
        BlocProvider(create: (context) => NotesCreateCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo App',
        theme: customTheme,
        home: const Homepage(),
      ),
    );
  }
}
