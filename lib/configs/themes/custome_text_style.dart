import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quesapp/configs/themes/app_colors.dart';
import 'package:quesapp/configs/themes/ui_parameter.dart';

TextStyle CartTitle(context)=>
TextStyle(
          color: UIparamenters.isDarkMode()?Theme.of(context).textTheme.bodyText1!.color:
          Theme.of(context).primaryColor,
          fontSize: 18, 
          fontWeight: FontWeight.bold
          );
const detailText = TextStyle(fontSize: 12);
const headerText = TextStyle(fontSize: 22, fontWeight: FontWeight.w700,color: onSurfaceTextColor);