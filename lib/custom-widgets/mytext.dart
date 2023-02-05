import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final double? paddingAll;
  final double paddingL;
  final double paddingR;
  final double paddingT;
  final double paddingB;
  final double? size;
  final FontWeight? weight;
  final Color? color;
  final String? fontFamily;

  const MyText(
      {required this.text,
      this.paddingAll,
      this.size,
      this.weight,
      this.color,
      this.paddingL = 2.0,
      this.paddingR = 2.0,
      this.paddingT = 2.0,
      this.paddingB = 2.0,
      this.fontFamily});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: (paddingAll != null)
          ? EdgeInsets.all(paddingAll!)
          : EdgeInsets.fromLTRB(paddingL, paddingT, paddingR, paddingB),
      child: Text(
        text,
        style: TextStyle(
            color: color ?? Colors.black,
            fontSize: size ?? 15.0,
            fontWeight: weight ?? FontWeight.normal,
            fontFamily: fontFamily ?? 'roboto'),
      ),
    );
  }
}
