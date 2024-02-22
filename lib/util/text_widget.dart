import 'package:flutter/material.dart';

class TextWidget {
  String? text;
  bool isAlignEnd = false;
  Color? color;
  double? size;
  int? maxline;
  TextWidget({
    this.maxline,
    this.size,
    this.color,
    required this.text,
  });

  Widget fontwidth800() {
    return Text(
      text ?? "",
      style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: size ?? 30,
          color: color ?? const Color.fromARGB(255, 0, 29, 52)),
    );
  }

  Widget fontwidth600() {
    return Text(
      text ?? "",
      style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: size ?? 25,
          color: color ?? const Color.fromARGB(255, 0, 29, 52)),
    );
  }

  Widget fontwidth500({required bool isAlignEnd}) {
    return Text(
      text ?? "",
      textAlign: isAlignEnd ? TextAlign.end : null,
      style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: size ?? 17,
          color: color ?? const Color.fromARGB(255, 190, 214, 255)),
    );
  }

  Widget textFontSize() {
    return Text(text ?? '',
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontSize: size ?? 12,
            fontWeight: FontWeight.w400,
            color: color ?? Colors.black));
  }

  Widget addressText() {
    return Row(
      children: [
        Icon(
          Icons.location_on_sharp,
          color: color ?? Colors.red,
          size: size ?? 12,
        ),
        SizedBox(
          width: 5,
        ),
        textFontSize()
      ],
    );
  }
}
