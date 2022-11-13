import 'dart:developer';

import 'package:get/get.dart';
import 'package:quesapp/controllers/question_paper_controller.dart';
import 'package:quesapp/controllers/zoom_drawer_controller.dart';
import 'package:quesapp/screen/home/home_screen.dart';
import 'package:quesapp/screen/introduction/introduction.dart';

import '../screen/splash/splash_screen.dart';

class Approute{
 static List<GetPage>  routes()=>[
    GetPage(name: "/",page:()=> SplashScreen()),
    GetPage(name: "/introduction",page:()=> IntroductionScreen()),
    GetPage(name: "/home", page: ()=> HomeScreen(),
    binding: BindingsBuilder(() {
    Get.put<QuestionPaperController>(QuestionPaperController());
    Get.put<MyDrawerController>(MyDrawerController());
    }
    ),
    ),
  ];
}