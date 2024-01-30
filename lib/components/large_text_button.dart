import 'package:app/utilities/ui_constants.dart';
import 'package:flutter/material.dart';

class LargeTextButton extends StatelessWidget {
  final Color color;
  final String text;
  final void Function() onPress;

  const LargeTextButton({
    super.key,
    required this.color,
    required this.text,
    required this.onPress,
  });

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
