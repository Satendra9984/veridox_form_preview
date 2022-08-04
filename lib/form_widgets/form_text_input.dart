import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormTextInput extends StatefulWidget {
  var widgetData;
  FormTextInput({
    Key? key,
    required this.widgetData,
  }) : super(key: key);

  @override
  State<FormTextInput> createState() => _FormTextInputState();
}

class _FormTextInputState extends State<FormTextInput> {
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  TextInputType _getKeyboardType() {
    if (widget.widgetData['multi_line']) {
      return TextInputType.multiline;
    } else if (widget.widgetData['type'] == 'number') {
      return TextInputType.number;
    } else if (widget.widgetData['type'] == 'phone') {
      return TextInputType.phone;
    } else if (widget.widgetData['type'] == 'email') {
      return TextInputType.emailAddress;
    }

    return TextInputType.text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(bottom: 25),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            offset: const Offset(0.0, 2.5), //(x,y)
            blurRadius: 3.5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.widgetData['label'],
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextFormField(
            controller: _textEditingController,
            validator: (value) {
              if (widget.widgetData['required'] &&
                  (value == null || value.isEmpty)) {
                return 'Please enter some text';
              }
              if (value != null && value.length > widget.widgetData['length']) {
                return 'Enter text is exceeding the size';
              }
              if (value != null && widget.widgetData['type'] == 'phone') {
                bool phone = RegExp(
                        r'(^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$)')
                    .hasMatch(value ?? '');
                if (!phone) {
                  return 'Please enter a valid phone number';
                }
              }
              if (value != null &&
                  widget.widgetData['type'] == 'number' &&
                  int.tryParse(value) == null) {
                return 'Please enter a valid number';
              }
              if (value != null && widget.widgetData['type'] == 'email') {
                bool email = RegExp(
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                    .hasMatch(value ?? '');
                if (!email) {
                  return 'Please enter a valid email';
                }
              }
              return null;
            },
            minLines: widget.widgetData['multi_line'] ? 3 : 1,
            maxLines: widget.widgetData['multi_line'] ? 7 : 1,
            maxLength: widget.widgetData['length'],
            keyboardType: _getKeyboardType(),
            decoration: const InputDecoration(
              //   border: InputBorder.none,
              //   focusedBorder: InputBorder.none,
              //   enabledBorder: InputBorder.none,
              //   errorBorder: InputBorder.none,
              //   disabledBorder: InputBorder.none,
              isDense: true, // Added this
              contentPadding: EdgeInsets.all(12),
            ),
          ),
        ],
      ),
    );
  }
}
