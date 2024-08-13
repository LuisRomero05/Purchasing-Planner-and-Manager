import 'dart:developer';
import 'package:get/get.dart';
import 'package:application_purchasing_planner_and_manager/backend/models.dart';

class NoteController extends GetxController {
  final noteList = [].obs;

  @override
  void onReady() {
    getNotes();
    super.onReady();
  }

  Future<void> addNote({required Note note}) async {
    try {
      //await DBHelper.insert(note);
    } catch (e) {
      log('Exception (notController): $e');
    }
    getNotes();
  }

  Future<void> getNotes() async {
    //List<Map<String, dynamic>> notes = await DBHelper.query();
    //noteList.assignAll(notes.map((data) => Note.fromJson(data)).toList());
  }

  Future<void> deleteNote({required Note note}) async {
    //await DBHelper.delete(note);
    getNotes();
  }

  Future<void> updateNote({required Note note}) async {
    //await DBHelper.update(note);
    getNotes();
  }
}