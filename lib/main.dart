import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

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
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          final user = snapshot.data;
          if (user == null) {
            return const Scaffold(
              body: Center(
                child: Text('Jesteś niezalogowany'),
              ),
            );
          }
          return Center(
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Medieval History Quiz'),
              ),
            ),
          );
        });
  }
}
