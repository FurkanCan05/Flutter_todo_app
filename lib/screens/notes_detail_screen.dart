import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/entity/notes.dart';
import 'package:todo_app/screens/cubit/notes_detail_cubit.dart';

class NotesDetail extends StatelessWidget {
  NotesDetail({super.key, required this.note, required this.index});

  Notes note;
  int index;
  var input = TextEditingController();

  void updateNore(BuildContext context, int id, String content) {
    context.read<NotesDetailCubit>().updateNote(id, content);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Note $index"),
        centerTitle: true,
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              child: Column(children: [
                Text(
                  note.content,
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(color: Colors.white),
                ),
                const Divider(thickness: 2),
              ]),
            ),
            TextField(
              controller: input,
              decoration:
                  const InputDecoration(hintText: "Write your new note here"),
            ),
            ElevatedButton(
              onPressed: () => updateNore(context, note.id, input.text),
              child: const Text("Update Note"),
            ),
          ],
        ),
      )),
    );
  }
}
