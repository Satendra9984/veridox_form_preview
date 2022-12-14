import 'package:flutter/material.dart';
import 'package:veridox_form_preview/form_widgets/date_time.dart';
import 'package:veridox_form_preview/form_widgets/dropdown.dart';
import 'package:veridox_form_preview/form_widgets/form_file_input.dart';
import 'package:veridox_form_preview/form_widgets/form_text_input.dart';
import 'package:veridox_form_preview/form_widgets/image_input.dart';
import 'package:veridox_form_preview/form_widgets/table.dart';
import 'package:veridox_form_preview/form_widgets/toggle_button.dart';
import '../form_widgets/text.dart';

class FormPage extends StatefulWidget {
  var singlePageData;
  final PageController pageController;
  final int currentPage;
  final int totalPages;
  FormPage({
    Key? key,
    required this.currentPage,
    required this.singlePageData,
    required this.pageController,
    required this.totalPages,
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
    _initializePageData();
  }

  void _initializePageData() {
    _pageData = widget.singlePageData['fields'] ?? [];
  }

  int _getLength() {
    List<dynamic> wid = _pageData as List<dynamic>;
    return wid.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      // appBar: AppBar(
      //   title: Text('Page No.--> ${widget.page.toString()}'),
      // ),

      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(15.234589786),
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: _getLength(),
                        itemBuilder: (context, index) {
                          var field = _pageData;
                          // print('fields --> $field');
                          if (field[index] != null &&
                              field[index]['widget'] == 'text') {
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
                              widgetJson: field[index],
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
                              widgetData: field[index],
                            );
                          } else if (field[index] != null &&
                              field[index]['widget'] == 'file') {
                            return FormFileInput(
                              widgetJson: field[index],
                            );
                          } else if (field[index] != null &&
                              field[index]['widget'] == 'image') {
                            return ImageInput(
                              widgetJson: field[index],
                            );
                          } else if (field[index] != null &&
                              field[index]['widget'] == 'table') {
                            return FormTableInput(
                              widgetJson: field[index],
                            );
                          } else {
                            return const Text('Start make some form');
                          }
                        },
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          widget.currentPage > 0
                              ? ElevatedButton(
                                  onPressed: () {
                                    widget.pageController
                                        .jumpToPage(widget.currentPage - 1);
                                  },
                                  child: const Center(
                                    child: Text('Back'),
                                  ),
                                )
                              : const Text(''),
                          const SizedBox(width: 15),
                          widget.currentPage < widget.totalPages - 1
                              ? ElevatedButton(
                                  onPressed: () {
                                    widget.pageController
                                        .jumpToPage(widget.currentPage + 1);
                                  },
                                  child: const Center(
                                    child: Text('Next'),
                                  ),
                                )
                              : const Text(''),
                        ],
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
