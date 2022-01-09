import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medieval_history_quiz/app/cubit/firstpage_cubit.dart';
import 'package:medieval_history_quiz/app/features/home/home_page.dart';
import 'package:medieval_history_quiz/app/features/login/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const FirstPageQuiz());
  }
}

class FirstPageQuiz extends StatelessWidget {
  const FirstPageQuiz({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FirstpageCubit()..start(),
      child: BlocBuilder<FirstpageCubit, FirstpageState>(
        builder: (context, state) {
          final user = state.user;
          if (user == null) {
            return LoginPage();
          }
          return HomePage(user: user);
        },
      ),
    );
  }
}
