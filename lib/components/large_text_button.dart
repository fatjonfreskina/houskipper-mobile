import 'package:app/utilities/ui_constants.dart';
import 'package:flutter/material.dart';

class LargeTextButton extends StatelessWidget {
  LargeTextButton({Key? key, required this.color, required this.text, required this.onPress}) : super(key: key);

  final Color color;
  final String text;
  void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(color),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      onPressed: onPress,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: const TextStyle(color: kColorWhite, fontSize: 18),
        ),
      ),
    );
  }
}
