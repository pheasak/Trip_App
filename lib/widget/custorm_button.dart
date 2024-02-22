import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class CustormButton {
  String? text;
  void Function()? onClicked;
  Color? color;
  CustormButton({required this.text, required this.onClicked, this.color});
  Widget cupertinoButton({double? borderRadius}) {
    return CupertinoButton(
      onPressed: onClicked,
      child: Container(
        alignment: Alignment.center,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 50),
            color: color ?? Colors.blue),
        child: Text(
          text ?? "",
          style:
              const TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
    );
  }
}

Widget iconButton(
    {required IconData icon,
    required Function() onProgress,
    EdgeInsetsGeometry? padding,
    Color? color}) {
  return Padding(
    padding: padding ?? const EdgeInsets.all(8.0),
    child: DecoratedBox(
      decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: IconButton(onPressed: onProgress, icon: Icon(icon)),
    ),
  );
}

Widget likeButton(
    {required Function() onProgress,
    EdgeInsetsGeometry? padding,
    double? size,
    Color? color}) {
  return Padding(
    padding: padding ?? const EdgeInsets.all(8.0),
    child: SizedBox(
      height: 43,
      width: 43,
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: color ?? Colors.white,
            borderRadius: BorderRadius.circular(15)),
        child: LikeButton(
          padding: EdgeInsets.all(5),
          size: size ?? 25,
          likeBuilder: (isLiked) {
            return Icon(
              isLiked ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            );
          },
        ),
      ),
    ),
  );
}
