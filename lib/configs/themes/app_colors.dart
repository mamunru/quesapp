import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quesapp/configs/themes/app_dark_theme.dart';
import 'package:quesapp/configs/themes/app_light_theme.dart';
import 'package:quesapp/configs/themes/ui_parameter.dart';

const Color onSurfaceTextColor = Colors.white;

const mainGradientLight = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomLeft,
  colors:[
    PrimaryLightColorLight,
    PrimaryColorLight
  ]
   );


const mainGradientDark = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomLeft,
  colors:[
    PrimarydarkColordark,
    PrimaryColordark
  ]
);

LinearGradient mainGradient()=>
  UIparamenters.isDarkMode()?mainGradientDark:mainGradientLight;

customeScaffoldColor( BuildContext context)=>
  UIparamenters.isDarkMode()?Color.fromRGBO(20, 45, 150, 1):
  const Color.fromARGB(255, 240, 237, 255);
