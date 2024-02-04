import 'package:app/utilities/ui_constants.dart';
import 'package:flutter/material.dart';

class LabeledInputText extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  const LabeledInputText(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labelText, style: kFormLabelTextStyle),
          TextField(
            style: kFormTextStyle,
            controller: controller,
            obscureText: obscureText,
          ),
        ],
      ),
    );
  }
}
