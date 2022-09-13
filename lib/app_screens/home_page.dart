import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:veridox_form_preview/app_screens/form_page.dart';
import 'package:veridox_form_preview/app_screens/initial_form_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final PageController _pageController;
  late int _totalPages = -1;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void deactivate() {
    _pageController.dispose();
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),

      /// realtime form data will be come here
      body: StreamBuilder(
        stream: FirebaseDatabase.instance.ref().onValue,
        builder: (context, AsyncSnapshot<DatabaseEvent> form) {
          var snapshot = form.data?.snapshot.value;

          if (form.connectionState == ConnectionState.waiting) {
            // debugPrint('fine 63');
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (form.hasData && snapshot != null) {
            // debugPrint('fine 67');
            final data =
                Map<String, dynamic>.from(snapshot as Map<dynamic, dynamic>);

            // debugPrint('new data --> ${data.toString()}');
            // debugPrint('data type for page --> ${data.runtimeType}');

            return InitialFormPageView(pagesData: data);
          } else if (snapshot == null) {
            // debugPrint('fine 75');
            return const Center(
              child: Text('Form will be displayed here'),
            );
          } else {
            // debugPrint('fine 80');
            return const Center(
              child: Text('Data not loaded'),
            );
          }
        },
      ),
    );
  }
}
