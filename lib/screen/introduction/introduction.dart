import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:quesapp/configs/themes/app_colors.dart';
import 'package:quesapp/widgets/app_circle_button.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient()),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width*.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Icon(Icons.star, size: 65),
              SizedBox(height: 48,),
              Text("This is study app. It is build in Flutter with Firebase. This Program is very high lavel program and the state managment is Getx",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: onSurfaceTextColor,
                fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(height: 48,),
              AppCircleButton(
                // ignore: avoid_returning_null_for_void
                onTap: ()=>Get.toNamed('/home'),
                child: Icon(Icons.arrow_forward),)
            ],
          ),
        ),
      ),
    );
  }
}