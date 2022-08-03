import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  var singlePageData;
  FormPage({
    Key? key,
    required this.singlePageData,
  }) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  late var _pageData;

  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      print('list in form page --> ${widget.singlePageData['id'].toString()}');
    }

    _initializePageData();
  }

  void _initializePageData() {
    _pageData = widget.singlePageData['fields'];
    print(_pageData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text(
              (widget.singlePageData['id'] + 1).toString(),
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
