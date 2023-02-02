import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/repo/notes_repository.dart';

class NotesCreateCubit extends Cubit {
  NotesCreateCubit() : super(0);

  var nRepo = NotesRepository();

  Future<void> createNote(String content) async {
    await nRepo.createNote(content);
  }
}
