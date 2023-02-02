import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/screens/cubit/notes_create_cubit.dart';

class CreateNote extends StatelessWidget {
  CreateNote({super.key});

  var input = TextEditingController();

  void cancelButton(BuildContext context) {
    Navigator.pop(context);
  }

  void saveButton(BuildContext context, String content) {
    context
        .read<NotesCreateCubit>()
        .createNote(content)
        .then((value) => Navigator.pop(context));
    //Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("New Note"),
      content: TextField(
        controller: input,
        decoration: const InputDecoration(hintText: "Write note here"),
      ),
      actions: [
        TextButton(
            onPressed: () => cancelButton(context),
            child: const Text("Cancel")),
        TextButton(
            onPressed: () => saveButton(context, input.text),
            child: const Text("Save")),
      ],
    );
  }
}
