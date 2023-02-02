import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/entity/notes.dart';
import 'package:todo_app/screens/cubit/notes_display_cubit.dart';
import 'package:todo_app/screens/notes_detail_screen.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  void initState() {
    super.initState();
    context.read<NotesDisplayCubit>().loadNotes();
  }

  void deleteNote(int id) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Do you want to delete this note?"),
      action: SnackBarAction(
        label: "Yes",
        onPressed: () {
          context.read<NotesDisplayCubit>().deleteNote(id);
        },
      ),
    ));
  }

  void refreshNotes() {
    context.read<NotesDisplayCubit>().loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: BlocBuilder<NotesDisplayCubit, List<Notes>>(
        builder: (context, state) {
          if (state.isNotEmpty) {
            return ListView.builder(
              itemCount: state.length,
              itemBuilder: (context, index) {
                var note = state[index];
                return Card(
                  child: ListTile(
                    leading: Text((index + 1).toString()),
                    title: Text(note.content),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NotesDetail(
                              note: note,
                              index: index + 1,
                            ),
                          )).then((value) => refreshNotes());
                    },
                    trailing: IconButton(
                        onPressed: () => deleteNote(note.id),
                        icon: const Icon(Icons.delete)),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text("No Data"),
            );
          }
        },
      ),
    );
  }
}
