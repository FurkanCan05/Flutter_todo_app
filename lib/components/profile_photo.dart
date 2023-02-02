import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/screens/cubit/profile_photo_cubit.dart';

class ProfilePhoto extends StatelessWidget {
  ProfilePhoto({super.key});
  final List<int> photos = List.generate(18, (index) => index);
  final String title = "Choose a profile photo";

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return profilePhonoAlertDialog(screenHeight);
          },
        );
      },
      child: BlocBuilder<ProfilePageCubit, int>(
        builder: (context, state) => Image.asset("lib/assets/$state.png"),
      ),
    );
  }

  AlertDialog profilePhonoAlertDialog(double screenHeight) {
    return AlertDialog(
      title: Center(
        child: Text(title),
      ),
      content: SizedBox(
        width: screenHeight * 0.6,
        height: 400.0,
        child: GridView.builder(
          itemCount: photos.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                context.read<ProfilePageCubit>().changeProfilePhoto(index);
                Navigator.pop(context);
              },
              child: Image.asset("lib/assets/$index.png"),
            );
          },
        ),
      ),
    );
  }
}
