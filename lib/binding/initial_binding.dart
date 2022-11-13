

import 'package:get/get.dart';
import 'package:quesapp/controllers/auth_controller.dart';
import 'package:quesapp/controllers/question_paper_controller.dart';
import 'package:quesapp/controllers/theme_controller.dart';
import 'package:quesapp/services/firebase_storage_service.dart';


class InitialBindings implements Bindings{

  
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController(),permanent: true);
   // Get.put(QuestionPaperController());
    Get.lazyPut(() =>  FirebaseStorageServices());
  }
}