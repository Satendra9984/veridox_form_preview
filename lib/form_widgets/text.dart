import 'package:flutter/cupertino.dart';

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
    _isHeading = widget.widgetData['is_heading'];
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.widgetData['label'],
      style: TextStyle(
        fontSize: _isHeading ? 24 : 14,
      ),
    );
  }
}
