import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MedievalLevelsPageContent extends StatelessWidget {
  const MedievalLevelsPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('levels').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text("Loading"));
          }
          final documents = snapshot.data!.docs;

          return ListView(
            children: [
              for (final document in documents) ...[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        document['basic'],
                      ),
                      Text(
                        document['medium'],
                      ),
                      Text(
                        document['hard'],
                      ),
                    ],
                  ),
                ),
              ],
            ],
          );
        });
  }
}
