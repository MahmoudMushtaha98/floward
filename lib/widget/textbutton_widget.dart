
import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    super.key,
    required this.callback, required this.height, required this.width, required this.text, required this.color, required this.colorText,
  });

  final VoidCallback callback;
  final double height;
  final double width;
  final String text;
  final Color? color;
  final Color? colorText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: const ShapeDecoration(shape: CircleBorder(side: BorderSide(style: BorderStyle.none))),
      child: TextButton(
        style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(color)),
        onPressed: callback,
        child: Text(text,style: TextStyle(fontSize: 17,color: colorText)),
      ),
    );
  }
}