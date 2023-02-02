import 'package:todo_app/data/entity/notes.dart';
import 'package:todo_app/data/sqlite/database.dart';

class NotesRepository {
  //Tüm notların listelenmesi
  Future<List<Notes>> loadNotes() async {
    var db = await MyDatabase.accessDatabase();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM toDos");

    return List.generate(maps.length, (index) {
      var row = maps[index];
      return Notes(id: row["id"], content: row["content"]);
    });
  }

  //Not silme
  Future<void> deleteNote(int id) async {
    var db = await MyDatabase.accessDatabase();
    await db.rawQuery("DELETE FROM toDos WHERE id = $id");
  }

  //Arama yapma
  Future<List<Notes>> searchNote(String text) async {
    var db = await MyDatabase.accessDatabase();
    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM toDos WHERE content LIKE '%$text%'");

    return List.generate(
      maps.length,
      (index) {
        var row = maps[index];
        return Notes(id: row["id"], content: row["content"]);
      },
    );
  }

  //Yeni not oluşturma
  Future<void> createNote(String content) async {
    var db = await MyDatabase.accessDatabase();
    var data = Map<String, dynamic>();
    data["content"] = content;
    await db.insert("toDos", data);
  }

  //Mevcut notu güncelleme
  Future<void> updateNote(int id, String content) async {
    var db = await MyDatabase.accessDatabase();
    var data = Map<String, dynamic>();
    data["content"] = content;
    await db.update("toDos", data, where: "id=?", whereArgs: [id]);
  }
}
