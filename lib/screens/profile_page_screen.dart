import 'package:flutter/material.dart';
import 'package:todo_app/components/profile_photo.dart';
import 'package:todo_app/components/user_name.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ProfilePhoto(),
          UserName(),
        ],
      ),
    );
  }
}
