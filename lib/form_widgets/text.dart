import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextTitle extends StatefulWidget {
  final Map<String, dynamic> widgetData;
  const TextTitle({
    Key? key,
    required this.widgetData,
  }) : super(key: key);

  @override
  State<TextTitle> createState() => _TextTitleState();
}

class _TextTitleState extends State<TextTitle> {
  bool _isHeading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isHeading = widget.widgetData['is_heading'] ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(0.0, 2.5), //(x,y)
            blurRadius: 3.5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:
            _isHeading ? CrossAxisAlignment.center : CrossAxisAlignment.end,
        children: [
          _isHeading
              ? Center(
                  child: Text(
                    widget.widgetData['label'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : Text(
                  widget.widgetData['label'],
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
          // const SizedBox(
          //   height: 25,
          // ),
        ],
      ),
    );
  }
}
