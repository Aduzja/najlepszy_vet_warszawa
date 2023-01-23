import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ClinicPageContent extends StatelessWidget {
  const ClinicPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('clinic')
          .orderBy('rating', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('Something went wrong'),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Text('Loading'),
          );
        }

        final documents = snapshot.data!.docs;

        return ListView(
          children: [
            for (final document in documents) ...[
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          document['name'],
                        ),
                        Text(
                          document['street'],
                        ),
                      ],
                    ),
                    Text(
                      document['rating'].toString(),
                    ),
                  ],
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
