import 'package:flutter/material.dart';
import 'package:quesapp/configs/themes/sub_theme_data_mixing.dart';

const Color PrimarydarkColordark = Color(0xFF2e3c62);
const Color PrimaryColordark = Color(0xFF99ace1);

const Color mainTextColor = Colors.white;

class DarkTheme with SubthemeData{
  buildDarkTheme(){
   final ThemeData systemDarkTheme = ThemeData.dark();
   return systemDarkTheme.copyWith(
    iconTheme: getIconTheme(),
    textTheme: getTextThemes().apply(
      bodyColor:mainTextColor ,
      displayColor: mainTextColor
    )
   );
  }
  }