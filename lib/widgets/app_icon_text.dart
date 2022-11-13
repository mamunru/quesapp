import 'package:flutter/material.dart';

class AppIconText extends StatelessWidget {
  final Icon icon;
  final Widget text;
  
   AppIconText({Key? key, required this.icon, required this.text,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        SizedBox(
          width: 4,
        ),
        text
      ],
    );
  }
}