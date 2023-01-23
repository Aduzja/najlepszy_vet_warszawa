import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddOpinionPageContent extends StatefulWidget {
  const AddOpinionPageContent({
    Key? key,
    required this.onSave,
  }) : super(key: key);

  final Function onSave;

  @override
  State<AddOpinionPageContent> createState() => _AddOpinionPageContentState();
}

class _AddOpinionPageContentState extends State<AddOpinionPageContent> {
  var clinicName = '';
  var streetName = '';
  var rating = 3.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration:
                  const InputDecoration(hintText: 'Podaj nazwę kliniki'),
              onChanged: (newValue) {
                setState(() {
                  clinicName = newValue;
                });
              },
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Podaj adres'),
              onChanged: (newValue) {
                setState(
                  () {
                    streetName = newValue;
                  },
                );
              },
            ),
            Slider(
              onChanged: (newValue) {
                setState(() {
                  rating = newValue;
                });
              },
              value: rating,
              min: 1.0,
              max: 5.0,
              divisions: 8,
              label: rating.toString(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                onPressed: clinicName.isEmpty || streetName.isEmpty
                    ? null
                    : () {
                        FirebaseFirestore.instance.collection('clinic').add({
                          'name': clinicName,
                          'street': streetName,
                          'rating': 3.0,
                        });
                        widget.onSave();
                      },
                child: const Text('Dodaj'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
