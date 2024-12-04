import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final TextStyle? style;
  final OutlinedBorder? shape;
  final double? width;
  final double? height;

  const CustomButtonWidget(
      {super.key,
      required this.text,
      required this.onPressed,
      this.color = Colors.blue,
      this.style,
      this.shape,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: shape,
        ),
        child: Text(text, style: style),
      ),
    );
  }
}
