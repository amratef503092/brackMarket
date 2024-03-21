import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget
{
  final String text;
  final Function()? onPressed;
  final Color buttonColor;
  final Color textColor;
  final double elevation;
  final double borderRadius;

  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.buttonColor = Colors.blue,
    this.textColor = Colors.white,
    this.elevation = 8.0,
    this.borderRadius = 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
