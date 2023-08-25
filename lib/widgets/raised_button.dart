import 'package:flutter/material.dart';
import 'package:rti/config/theme.dart';

class MRaisedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? textColor;
  final Color? color;
  final EdgeInsets? padding;
  const MRaisedButton(
      {Key? key,
      required this.text,
      this.onPressed,
      this.textColor,
      this.color,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: MaterialButton(
        textColor: textColor ?? AppColors.white,
        color: color ?? AppColors.themePrimary,
        onPressed: onPressed!,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Text(text),
      ),
    );
  }
}
