import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/screens/cubit/username_cubit.dart';

class UserName extends StatelessWidget {
  UserName({super.key});

  final String title = "Change your username";
  final String usernameAlert = "Username can't be empty.";
  final txtController = TextEditingController();

  void okButton(BuildContext context) {
    context
        .read<UserNameCubit>()
        .changeUserName(txtController.text, context, usernameAlert);
    txtController.text = "";
    Navigator.pop(context);
  }

  void cancelButton(BuildContext context) {
    txtController.text = "";
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            //Only use for get text center
            onPressed: () {},
            icon: const Icon(
              Icons.edit,
              color: Colors.transparent,
            )),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: BlocBuilder<UserNameCubit, String>(
            builder: (context, state) => Text(
              state,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: Colors.white),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return userNameAlertDialog(context);
              },
            );
          },
          icon: const Icon(Icons.edit, color: Colors.grey),
        ),
      ],
    );
  }

  AlertDialog userNameAlertDialog(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      actions: [
        TextButton(
            onPressed: () => cancelButton(context),
            child: const Text("Cancel")),
        TextButton(onPressed: () => okButton(context), child: const Text("Ok")),
      ],
      content: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: TextField(
            maxLength: 15,
            maxLines: 1,
            controller: txtController,
          ),
        ),
      ),
    );
  }
}
