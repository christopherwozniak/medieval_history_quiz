import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medieval_history_quiz/app/cubit/firstpage_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAccountPageContent extends StatelessWidget {
  const MyAccountPageContent({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Witaj Odkrywco! Twoja domena to $email'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.read<FirstpageCubit>().signOut();
            },
            child: const Text('Wyloguj się'),
          ),
        ],
      ),
    );
  }
}
