import 'package:flutter/material.dart';
import 'package:veridox_form_preview/app_screens/file_upload.dart';
import 'package:veridox_form_preview/form_widgets/date_time.dart';
import 'package:veridox_form_preview/form_widgets/dropdown.dart';
import 'package:veridox_form_preview/form_widgets/form_text_input.dart';
import 'package:veridox_form_preview/form_widgets/image_input.dart';
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
    // print('form page reinitialized');
    // if (kDebugMode) {
    // print('list in form page --> ${widget.singlePageData['id'].toString()}');
    // }
    _initializePageData();
  }

  void _initializePageData() {
    _pageData = widget.singlePageData['fields'] ?? [];
    // print('page data --> $_pageData');
  }

  int _getLength() {
    List<dynamic> wid = _pageData as List<dynamic>;
    return wid.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageData.toString()),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _getLength(),
            itemBuilder: (context, index) {
              var field = _pageData;
              // print('fields --> $field');
              if (field[index] != null && field[index]['widget'] == 'text') {
                // print('text');
                return TextTitle(
                  widgetData: field[index],
                );
              } else if (field[index] != null &&
                  field[index]['widget'] == 'text-input') {
                // print('text_input');

                return FormTextInput(
                  widgetData: field[index],
                );
              } else if (field[index] != null &&
                  field[index]['widget'] == 'toggle-button') {
                // print('toggle');
                return ToggleButton(
                  widgetData: field[index],
                );
              } else if (field[index] != null &&
                  field[index]['widget'] == 'dropdown') {
                // print('dropdown');

                return DropdownMenu(
                  widgetJson: field[index],
                );
              } else if (field[index] != null &&
                  field[index]['widget'] == 'date-time') {
                // print('date time');

                return DateTimePicker(
                  widgetjson: field[index],
                );
              } else if (field[index] != null &&
                  field[index]['widget'] == 'file') {
                return FileUploadButton(
                  text: 'Upload location image',
                  location: 'location',
                  cntrl: TextEditingController(),
                );
              } else if (field[index] != null &&
                  field[index]['widget'] == 'image-input') {
                return ImageInput(
                  widgetJson: field[index]['widget'],
                );
              } else {
                return const Text('Start make some form');
              }
            },
          ),
        ),
      ),
      // body: Text('no error form page'),
    );
  }
}

/*
TextTitle(
                widgetData: {
                  'label': 'Basic Details',
                  'is_heading': true,
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
                  "type": "text",
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
              DateTimePicker(
                widgetjson: {
                  "label": "Date when you reached the house",
                  "widget": "date_time",
                  "required": true,
                  "id": 4,
                },
              ),
              FormTableInput(
                widgetJson: {
                  "widget": "table_input",
                  "label": "Profile of the life assured*",
                  "row_labels": [
                    "Name",
                    "Date of Birth",
                    "Age",
                    "Marital Status",
                    "Occupation",
                    "Annual Income",
                    "Education",
                    "Other life/health insurance",
                    "Address",
                    "Nominee Relationship"
                  ],
                  "column_labels": [
                    "As per investigation",
                    "Mismatch noted (Yes/No)",
                    "Evidence procured (Yes/No)"
                  ],
                  "value": [
                    {
                      "As per investigation": "",
                      "Mismatch noted (Yes/No)": "",
                      "Evidence procured (Yes/No)": ""
                    },
                    {
                      "As per investigation": "",
                      "Mismatch noted (Yes/No)": "",
                      "Evidence procured (Yes/No)": ""
                    },
                    {
                      "As per investigation": "",
                      "Mismatch noted (Yes/No)": "",
                      "Evidence procured (Yes/No)": ""
                    },
                    {
                      "As per investigation": "",
                      "Mismatch noted (Yes/No)": "",
                      "Evidence procured (Yes/No)": ""
                    },
                    {
                      "As per investigation": "",
                      "Mismatch noted (Yes/No)": "",
                      "Evidence procured (Yes/No)": ""
                    },
                    {
                      "As per investigation": "",
                      "Mismatch noted (Yes/No)": "",
                      "Evidence procured (Yes/No)": ""
                    },
                    {
                      "As per investigation": "",
                      "Mismatch noted (Yes/No)": "",
                      "Evidence procured (Yes/No)": ""
                    },
                    {
                      "As per investigation": "",
                      "Mismatch noted (Yes/No)": "",
                      "Evidence procured (Yes/No)": ""
                    },
                    {
                      "As per investigation": "",
                      "Mismatch noted (Yes/No)": "",
                      "Evidence procured (Yes/No)": ""
                    },
                    {
                      "As per investigation": "",
                      "Mismatch noted (Yes/No)": "",
                      "Evidence procured (Yes/No)": ""
                    }
                  ]
                },
              )
* */

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
