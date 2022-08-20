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
  int _currentIndex = -1;
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

  Color _getColor() {
    if (_pageController.positions.isNotEmpty) {
      int currInd = _pageController.page?.toInt() ?? -1;
      if (currInd > 0) {
        return Colors.black;
      }
    }
    return Colors.grey;
  }

  Color _getRightArrowColor() {
    if (_pageController.positions.isNotEmpty) {
      int currInd = _pageController.page?.toInt() ?? -1;
      if (currInd < _totalPages - 1) {
        return Colors.black;
      }
    }
    return Colors.grey;
  }

  List<Widget> _getFormPages(Map<String, dynamic> form) {
    List<Widget> screen = [];

    List<dynamic>? pageData = form['forms']['pages'];
    if (pageData == null) {
      return screen;
    }
    _totalPages = pageData.length;
    _currentIndex = 0;
    // _pageController.jumpToPage(0);
    // _pageController.position.
    // debugPrint(
    // 'data in _getFormPages length --> ${pageData.length.toString()}',
    // );
    for (int i = 0; i < pageData.length; i++) {
      screen.add(
        FormPage(singlePageData: pageData[i]),
      );
    }
    if (kDebugMode) {
      // print('line 71 --> home page');
    }

    return screen;
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

          if (kDebugMode) {
            // print('data type --> ${snapshot.runtimeType}');
          }

          // debugPrint('fine 61');
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
      // bottomNavigationBar: Row(
      //   children: [
      //     IconButton(
      //       onPressed: () {
      //         if (_currentIndex > 0) {
      //           _currentIndex -= 1;
      //           _pageController.jumpToPage(_currentIndex);
      //         }
      //       },
      //       icon: Icon(
      //         Icons.arrow_back,
      //         color: _getColor(),
      //       ),
      //     ),
      //     IconButton(
      //       onPressed: () {
      //         if (_currentIndex < _totalPages - 1) {
      //           _currentIndex += 1;
      //           _pageController.jumpToPage(_currentIndex);
      //         }
      //       },
      //       icon: Icon(
      //         Icons.arrow_forward,
      //         color: _getRightArrowColor(),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
