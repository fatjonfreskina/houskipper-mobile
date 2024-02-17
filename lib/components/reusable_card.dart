import 'package:app/utilities/ui_constants.dart';
import 'package:flutter/material.dart';

// TODO: Style cards

class ReusableCard extends StatelessWidget {
  const ReusableCard(
      {super.key, required this.color, this.cardChild, required this.onPress});

  final Color color;
  final Widget? cardChild;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
          border: Border.all(
            color:
                kColorGreySecondary, // Replace with your desired border color
            width: 2.0, // Replace with your desired border width
          ),
        ),
        child: cardChild,
      ),
    );
  }
}
