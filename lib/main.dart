import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quesapp/binding/initial_binding.dart';
import 'package:quesapp/configs/themes/app_light_theme.dart';
import 'package:quesapp/controllers/theme_controller.dart';
import 'package:quesapp/data_uploder_screen.dart';
import 'package:quesapp/firebase_options.dart';
import 'package:quesapp/routes/app_routes.dart';
import 'package:quesapp/screen/introduction/introduction.dart';
import 'package:quesapp/screen/splash/splash_screen.dart';


//It  only use to upload data in Firebase Cloude otherwish it not be used
//Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
//   runApp(GetMaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: DataUploaderScreen(),));
// }

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  InitialBindings().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Get.find<ThemeController>().lightTheme,
      getPages: Approute.routes(),
    );
    
  }
}

