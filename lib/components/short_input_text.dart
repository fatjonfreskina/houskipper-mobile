import 'package:app/utilities/ui_constants.dart';
import 'package:flutter/material.dart';

class ShortInputText extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  const ShortInputText(
      {super.key, required this.controller, required this.hintText});

  @override
  State<ShortInputText> createState() => _ShortInputTextState();
}

class _ShortInputTextState extends State<ShortInputText> {
  _ShortInputTextState();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 240.0,
        child: TextField(
            controller: widget.controller,
            decoration: InputDecoration(
                hoverColor: kColorBluePrimary,
                focusColor: kColorBluePrimary,
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: kColorBluePrimary)),
                labelText: widget.hintText)));
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }
}
