import 'package:app/utilities/ui_constants.dart';
import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  final bool initialState;
  final Function(bool) onToggle;

  const SwitchButton(
      {super.key, required this.initialState, required this.onToggle});

  @override
  State<SwitchButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<SwitchButton> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: widget.initialState,
      activeColor: kColorBluePrimary,
      onChanged: (bool newValue) {
        widget.onToggle(newValue);
      },
    );
  }
}
