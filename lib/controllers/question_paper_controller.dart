import 'package:get/get.dart';
import 'package:quesapp/firebase_rsf/referances.dart';
import 'package:quesapp/models/question_paper_model.dart';

import '../services/firebase_storage_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionPaperController extends GetxController{

final allPaperImages=<String>[].obs;
final allPapers=<QuestionPaperModel>[].obs;

  @override
  void onReady(){
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async{
    List<String> imgName=["biology","chemistry","maths","physics"];

    try {

      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();

     
      final paperList=  data.docs.map(
        (paper) => QuestionPaperModel.fromSnapshot(paper)
        ).toList();
        
      allPapers.assignAll(paperList);
      

      for (var paper in paperList ) {
        final imgUrl= await  Get.find<FirebaseStorageServices>().getImage(paper.title);
        print('======== image url'+imgUrl!);
        paper.imageUrl = imgUrl;
        //  allPaperImages.add(imagUrl!);
      }
      allPapers.assignAll(paperList);
    } catch (e) {
      print(e);
    }
  }
}