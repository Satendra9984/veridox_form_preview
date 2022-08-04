import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../app_constants.dart';

class ToggleButton extends StatefulWidget {
  final Map<String, dynamic> widgetData;
  // final Function(dynamic value) onChange;
  const ToggleButton({
    Key? key,
    required this.widgetData,
    // required this.onChange,
  }) : super(key: key);

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  bool status = false;

  @override
  void initState() {
    super.initState();
    status = widget.widgetData['value'] ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: containerElevationDecoration,
          child: Row(
            children: [
              Expanded(
                flex: 8,
                child: Text(
                  widget.widgetData['label'],
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    // color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                flex: 2,
                child: FlutterSwitch(
                  width: 55.0,
                  height: 30.0,
                  toggleSize: 25.0,
                  value: status,
                  onToggle: (val) {
                    setState(() {
                      status = val;
                    });
                    // widget.onChange(val);
                  },
                  activeColor: CupertinoColors.systemGreen,
                  inactiveColor: CupertinoColors.systemRed,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
