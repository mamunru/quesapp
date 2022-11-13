import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:quesapp/configs/themes/app_dark_theme.dart';
import 'package:quesapp/configs/themes/app_light_theme.dart';

class ThemeController extends GetxController{
  late ThemeData _darkTheme;
  late ThemeData _lightTheme;
  
  void onInit(){
    initializedThemeData();
    super.onInit();
  }


  initializedThemeData(){
    _darkTheme = DarkTheme().buildDarkTheme();
    _lightTheme = LightTheme().buildLightTheme();
  }

  ThemeData get darkTheme=> _darkTheme;
  ThemeData get lightTheme => _lightTheme;
}