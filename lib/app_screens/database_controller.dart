import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veridox_form_preview/services/firebase_services.dart';

class DataController extends StatelessWidget {
  const DataController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              final firebaseService = FirebaseServices();
              await firebaseService.setSampleForm();
            },
            child: Text('Write to database'),
          ),
        ],
      ),
    );
  }
}
