import 'package:app/utilities/ui_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  SwitchButton({super.key, required this.isActive, required this.onToggle});
  bool isActive;
  final Function(bool) onToggle;

  @override
  State<SwitchButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<SwitchButton> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: widget.isActive,
      activeColor: kColorBluePrimary,
      onChanged: (bool newValue) {
        widget.onToggle(newValue);
      },
    );
  }
}
