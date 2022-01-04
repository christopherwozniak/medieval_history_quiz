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
  var opinion = 3.0;
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
          Slider(
            onChanged: (newValue) {
              setState(() {
                opinion = newValue;
              });
            },
            value: opinion,
            min: 1.0,
            max: 6.0,
            divisions: 10,
            label: opinion.toString(),
          ),
          ElevatedButton(
            onPressed: () {
              FirebaseFirestore.instance.collection('levels').add({
                'basic': basicName,
                'medium': mediumName,
                'hard': hardName,
                'opinion': opinion,
              });
            },
            child: const Text('Dodaj opinię'),
          ),
        ],
      ),
    );
  }
}
