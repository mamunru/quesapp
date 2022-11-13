import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/state_manager.dart';
import 'package:quesapp/configs/themes/app_colors.dart';
import 'package:quesapp/controllers/zoom_drawer_controller.dart';

class MenuScreen extends GetView<MyDrawerController> {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        gradient: mainGradient()
      ),
      child: Theme(
        data: ThemeData(textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(primary: onSurfaceTextColor))), 
        child: SafeArea(child: Stack(
          children: [
            Positioned(
              top: 0,right: MediaQuery.of(context).size.width*.35,
              child: BackButton(
                
              color: Colors.white,
              onPressed: (){
                controller.toggleDrawer();
              },
            ))
          ],
        ))),
    );
  }
}