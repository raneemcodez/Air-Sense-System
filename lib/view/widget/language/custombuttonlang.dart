import 'package:flutter/material.dart';
import 'package:airaystem/core/constant/color.dart';

class CustomButtonLang extends StatelessWidget {
  final String textbutton;
  final Color? buttonColor;
  final Color? textColor;
  final double? fontSize;
  final void Function()? onPressed;

  const CustomButtonLang({
    super.key,
    required this.textbutton,
    this.buttonColor = AppColor.green,
    this.textColor = Colors.white,
    this.fontSize = 16,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5, left: 5),
      padding: EdgeInsets.only(right: 10, left: 10),
      child: MaterialButton(
        onPressed: onPressed,
        color: buttonColor,
        textColor: textColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Text(
          textbutton,
          style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
