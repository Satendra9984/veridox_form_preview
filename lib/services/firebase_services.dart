import 'package:firebase_database/firebase_database.dart';

class FirebaseServices {
  final _firebaseRefer = FirebaseDatabase.instance;
  Future<DataSnapshot> getFormData() async {
    final refer = _firebaseRefer.ref('form');
    Map<String, dynamic> formData;
    refer.onValue.listen((event) {
      var form = event.snapshot.value;
      formData = Map<String, dynamic>.from(form as Map<dynamic, dynamic>);
    });

    return await refer.get();
  }

  Future<void> setSampleForm() async {
    final Map<String, dynamic> formData = {
      "name": "new form",
      "pages": [
        {
          "name": "new page",
          "fields": [
            {
              "label": "untitled",
              "widget": "text",
              "is_heading": false,
              "length": "300",
              "id": 0
            },
            {
              "label": "label1",
              "widget": "widget",
              "id": 1,
            },
            {
              "label": "label2",
              "widget": "widget",
              "id": 2,
            },
            {
              "label": "label3",
              "widget": "widget",
              "id": 3,
            }
          ],
          "id": 0
        },
        {
          "name": "new page",
          "fields": [
            {
              "label": "label1",
              "widget": "widget",
              "id": 0,
            }
          ]
        }
      ]
    };
    _firebaseRefer.ref('forms').set(formData);
  }
}
