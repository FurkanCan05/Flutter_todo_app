import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/repo/profile_page_repository.dart';

class ProfilePageCubit extends Cubit<int> {
  ProfilePageCubit() : super(0);
  var pRepo = ProfilePageRepo();

  void changeProfilePhoto(int index) {
    emit(pRepo.changeProfilePhoto(index));
  }
}
