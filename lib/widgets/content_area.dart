import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quesapp/configs/themes/app_colors.dart';
import 'package:quesapp/configs/themes/ui_parameter.dart';

class ContentAread extends StatelessWidget {
  final bool addPadding;
  final Widget child;
    ContentAread({Key? key, 
   required this.child, this.addPadding=true
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      clipBehavior: Clip.hardEdge,
      type: MaterialType.transparency,
      child: Ink(
        decoration: BoxDecoration(
          color:customeScaffoldColor(context)
        ),
        padding: addPadding?EdgeInsets.only(top: mobileScreenPadding, left: mobileScreenPadding, right: mobileScreenPadding): EdgeInsets.zero,
        child: child,
      ),
    );
  }
}