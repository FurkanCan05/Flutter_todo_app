import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/repo/notes_repository.dart';

class NotesDetailCubit extends Cubit {
  NotesDetailCubit() : super(0);

  var nRepo = NotesRepository();

  Future<void> updateNote(int id, String content) async {
    await nRepo.updateNote(id, content);
  }
}
