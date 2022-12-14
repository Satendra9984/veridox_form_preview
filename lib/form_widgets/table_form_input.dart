import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormTableTextInput extends StatefulWidget {
  final Map<String, dynamic> widgetData;
  const FormTableTextInput({
    Key? key,
    required this.widgetData,
  }) : super(key: key);

  @override
  State<FormTableTextInput> createState() => _FormTableTextInputState();
}

class _FormTableTextInputState extends State<FormTableTextInput> {
  late final TextEditingController _textEditingController;
  bool _isRequired = false;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    // debugPrint('form text input data --> ${widget.widgetData}');
    super.initState();
  }

  // TextInputType _getKeyboardType() {
  //   if (widget.widgetData['multi_line']) {
  //     return TextInputType.multiline;
  //   } else if (widget.widgetData['type'] == 'number') {
  //     return TextInputType.number;
  //   } else if (widget.widgetData['type'] == 'phone') {
  //     return TextInputType.phone;
  //   } else if (widget.widgetData['type'] == 'email') {
  //     return TextInputType.emailAddress;
  //   }
  //
  //   return TextInputType.text;
  // }

  String _getLabel() {
    String label = widget.widgetData['label'];

    if (widget.widgetData.containsKey('required') &&
        widget.widgetData['required'] == true) {
      label += '*';
      _isRequired = true;
    }
    return label;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _getLabel(),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _textEditingController,
            validator: (value) {
              // if (widget.widgetData['required'] &&
              //     (value == null || value.isEmpty)) {
              //   return 'Please enter some text';
              // }
              // if (value != null && value.length > widget.widgetData['length']) {
              //   return 'Enter text is exceeding the size';
              // }
              // if (value != null && widget.widgetData['type'] == 'phone') {
              //   bool phone = RegExp(
              //           r'(^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$)')
              //       .hasMatch(value ?? '');
              //   if (!phone) {
              //     return 'Please enter a valid phone number';
              //   }
              // }
              // if (value != null &&
              //     widget.widgetData['type'] == 'number' &&
              //     int.tryParse(value) == null) {
              //   return 'Please enter a valid number';
              // }
              // if (value != null && widget.widgetData['type'] == 'email') {
              //   bool email = RegExp(
              //           r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
              //       .hasMatch(value ?? '');
              //   if (!email) {
              //     return 'Please enter a valid email';
              //   }
              // }
              // return null;
            },
            minLines: 1,
            maxLines: widget.widgetData['multi_line'] ?? false ? 7 : 1,
            maxLength: widget.widgetData['length'],
            // keyboardType: _getKeyboardType(),
            decoration: const InputDecoration(
              hintText: 'Your Answer',
              hintStyle: TextStyle(
                fontSize: 14,
              ),
              isDense: true, // Added this
              // contentPadding: EdgeInsets.all(0),
            ),
          ),
        ],
      ),
    );
  }
}
