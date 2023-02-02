import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/repo/profile_page_repository.dart';

class UserNameCubit extends Cubit<String> {
  UserNameCubit() : super("User");
  var pRepo = ProfilePageRepo();

  void changeUserName(String text, BuildContext context, String usernameAlert) {
    String userName = text;
    if (userName != "") {
      emit(pRepo.changeUserName(userName));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text(usernameAlert, style: const TextStyle(color: Colors.white)),
          backgroundColor: Colors.red[800],
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }
}
