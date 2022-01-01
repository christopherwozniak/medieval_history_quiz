import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return const Center(
            child: Text('Sen to dobry pomysł nieprawdaz?'),
          );
        }
        if (currentIndex == 1) {
          return const Center(
            child: Text('Dwa'),
          );
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Witaj Odkrywco! Twoja domena to ${widget.user.email}'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: const Text('Wyloguj się'),
              ),
            ],
          ),
        );
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.king_bed,
              ),
              label: 'Idź spać'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
              ),
              label: 'Dodaj'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: 'Moje konto'),
        ],
      ),
    );
  }
}
