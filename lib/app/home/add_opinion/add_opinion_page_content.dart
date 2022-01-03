import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddOpinionPageContent extends StatefulWidget {
  const AddOpinionPageContent({
    Key? key,
  }) : super(key: key);

  @override
  State<AddOpinionPageContent> createState() => _AddOpinionPageContentState();
}

class _AddOpinionPageContentState extends State<AddOpinionPageContent> {
  var basicName = '';
  var mediumName = '';
  var hardName = '';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
              decoration: const InputDecoration(
                  hintText: 'Czy trudno było być Stajennym?'),
              onChanged: (newValue) {
                setState(() {
                  basicName = newValue;
                });
              }),
          TextField(
              decoration: const InputDecoration(
                  hintText: 'Jak podobał Ci się poziom trudności Giermka?'),
              onChanged: (newValue) {
                setState(() {
                  mediumName = newValue;
                });
              }),
          TextField(
              decoration: const InputDecoration(
                  hintText: 'Co sądzisz o poziomie trudności Rycerza?'),
              onChanged: (newValue) {
                setState(() {
                  hardName = newValue;
                });
              }),
          ElevatedButton(
            onPressed: () {
              FirebaseFirestore.instance.collection('levels').add({
                'basic': basicName,
                'medium': mediumName,
                'hard': hardName,
                'opinion': 3.0,
              });
            },
            child: const Text('Dodaj opinię'),
          ),
        ],
      ),
    );
  }
}
