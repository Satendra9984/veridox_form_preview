import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:veridox_form_preview/form_widgets/date_time.dart';
import 'package:veridox_form_preview/form_widgets/dropdown.dart';
import 'package:veridox_form_preview/form_widgets/form_text_input.dart';
import 'package:veridox_form_preview/form_widgets/toggle_button.dart';

import '../form_widgets/text.dart';

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
  final _formKey = GlobalKey<FormState>();
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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextTitle(
                  widgetData: {
                    'label': 'Payout Verification Form',
                    'is_heading': true,
                    'id': 0,
                    "widget": "text",
                  },
                ),
                TextTitle(
                  widgetData: {
                    'label': 'Basic Details',
                    'is_heading': false,
                    'id': 0,
                    "widget": "text",
                  },
                ),
                TextTitle(
                  widgetData: {
                    'label': 'Policy Number*-: 15671049',
                    'is_heading': false,
                    'id': 0,
                    "widget": "text",
                  },
                ),
                FormTextInput(
                  widgetData: {
                    "label": "Existing Address Details*",
                    "widget": "text_input",
                    "required": true,
                    "multi_line": false,
                    "type": "number",
                    "length": 10,
                    "id": 1,
                  },
                ),
                FormTextInput(
                  widgetData: {
                    "label": "State",
                    "widget": "text_input",
                    "required": true,
                    "multi_line": true,
                    "length": 300,
                    "id": 1,
                  },
                ),
                ToggleButton(
                  widgetData: {
                    "label": "Whether you meet the person ",
                    "widget": "toggle_button",
                    "required": true,
                    "id": 4,
                  },
                ),
                DropdownMenu(
                  widgetJson: {
                    "label": "Select itmes",
                    "widget": "dropdown",
                    "options": ['option 1', 'option 2', 'option 3', 'option 4'],
                    "required": true,
                    "id": 4,
                  },
                ),
                DateTimePicker(widgetjson: {
                  "label": "Date when you reached the house",
                  "widget": "date_time",
                  "required": true,
                  "id": 4,
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*
TextTitle(
                widgetData: {
                  'label': 'KRN-:  761561',
                  'is_heading': false,
                  'id': 0,
                  "widget": "text",
                },
              ),
              TextTitle(
                widgetData: {
                  'label': 'Application Number-: LL38616530',
                  'is_heading': false,
                  'id': 0,
                  "widget": "text",
                },
              ),
              TextTitle(
                widgetData: {
                  'label': 'Confirmation on Request Given *-:YES',
                  'is_heading': false,
                  'id': 0,
                  "widget": "text",
                },
              ),
              TextTitle(
                widgetData: {
                  'label': 'Customer Name*-: CHANDA DEVI',
                  'is_heading': false,
                  'id': 0,
                  "widget": "text",
                },
              ),
              TextTitle(
                widgetData: {
                  'label': 'Father Name-*NA',
                  'is_heading': false,
                  'id': 0,
                  "widget": "text",
                },
              ),
              TextTitle(
                widgetData: {
                  'label': 'Allocation Date*-:NOVEMBER 30 ,2021',
                  'is_heading': false,
                  'id': 0,
                  "widget": "text",
                },
              ),
              TextTitle(
                widgetData: {
                  'label': 'Father Name-*NA',
                  'is_heading': false,
                  'id': 0,
                  "widget": "text",
                },
              ),
              TextTitle(
                widgetData: {
                  'label':
                      'Date and Time of Field Visit*-:DECEMBER 3,2021 AND 10:40 PM',
                  'is_heading': false,
                  'id': 0,
                  "widget": "text",
                },
              ),
              TextTitle(
                widgetData: {
                  'label': 'Nominee DOB-*NA',
                  'is_heading': false,
                  'id': 0,
                  "widget": "text",
                },
              ),
              FormTextInput(
                widgetData: {
                  "label": "Pin Code",
                  "widget": "widget",
                  "id": 1,
                },
              ),
              FormTextInput(
                widgetData: {
                  "label": "Landmark",
                  "widget": "widget",
                  "id": 1,
                },
              ),
              FormTextInput(
                widgetData: {
                  "label": "Existing Address Details*",
                  "widget": "widget",
                  "id": 1,
                },
              ),
* */
