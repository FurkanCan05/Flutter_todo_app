import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/screens/create_note_popup_screen.dart';
import 'package:todo_app/screens/cubit/notes_display_cubit.dart';
import 'package:todo_app/screens/cubit/profile_photo_cubit.dart';
import 'package:todo_app/screens/notes_display_screen.dart';
import 'package:todo_app/screens/profile_page_screen.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int pageIndex = 0;
  final pages = <Widget>[const NotesPage(), const ProfilePage()];
  String notesText = "Notes";
  String profileText = "Profile";
  bool isSearching = false;

  void searchButtonFunc() {
    setState(() {
      isSearching = !isSearching;
    });
  }

  void refreshNotes() {
    context.read<NotesDisplayCubit>().loadNotes();
  }

  void searchNotes(String text) {
    context.read<NotesDisplayCubit>().searchNote(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: isSearching
              ? TextField(
                  decoration: const InputDecoration(
                    hintText: "Search...",
                  ),
                  onChanged: (value) => searchNotes(value),
                )
              : pageIndex == 0
                  ? Text(notesText)
                  : Text(profileText),
          centerTitle: true,
          leading: IconButton(
              onPressed: () => searchButtonFunc(),
              icon: const Icon(Icons.search)),
          actions: [
            profilePhoto(),
          ]),
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.note),
            label: notesText,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: profileText,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => CreateNote(),
          ).then((value) => refreshNotes());
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Padding profilePhoto() {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            pageIndex = 1;
          });
        },
        child: BlocBuilder<ProfilePageCubit, int>(
          builder: (context, state) => Image.asset(
            "lib/assets/$state.png",
            height: 32.0,
            width: 32.0,
          ),
        ),
      ),
    );
  }
}
