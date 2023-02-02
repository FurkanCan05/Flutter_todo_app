import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/entity/notes.dart';
import 'package:todo_app/data/repo/notes_repository.dart';

class NotesDisplayCubit extends Cubit<List<Notes>> {
  NotesDisplayCubit() : super(<Notes>[]);

  var nRepo = NotesRepository();

  Future<void> loadNotes() async {
    var list = await nRepo.loadNotes();
    emit(list);
  }

  Future<void> deleteNote(int id) async {
    await nRepo.deleteNote(id);
    await loadNotes();
  }

  Future<void> searchNote(String text) async {
    var list = await nRepo.searchNote(text);
    emit(list);
  }
}
