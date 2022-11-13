import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quesapp/firebase_rsf/loading_status.dart';
import 'package:quesapp/models/question_paper_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../firebase_rsf/referances.dart';

class DataUploader extends GetxController {

  @override 
  void onReady (){
    uploadData();
    super.onReady();
  }

  final loadingStatus= LoadingStatus.loading.obs;

  Future<void> uploadData() async {
    loadingStatus.value = LoadingStatus.loading; // value =0 
    //for firebase
    final fireStore = FirebaseFirestore.instance;
    print("============== Call Uploadata for data_uploader===========");
   final manifestContent= await DefaultAssetBundle.of(Get.context!)
   .loadString("AssetManifest.json");
   final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    
    //Load and Print Path
   final papersInAssets = manifestMap.keys.where((path) =>path.startsWith('assets/DB/papers') &&path.contains(".json") ) .toList();
 // print(papersInAssets);
  List<QuestionPaperModel> questionpapers=[];
  for (var paper in papersInAssets) {
    String StringPapercontent = await rootBundle.loadString(paper);
 
    questionpapers.add(QuestionPaperModel.fromJson(json.decode(StringPapercontent)));
  }

  //print('Items number is == ${questionpapers[0].description}');

  var batch = fireStore.batch();

  for(var paper in questionpapers){
    print(paper.id);
    batch.set(questionPaperRF.doc(paper.id), {
      
      "title":paper.title,
      'image_url':paper.imageUrl,
      "descriptions":paper.description,
      "time_seconds":paper.timeSeconds,
      "questions_count":paper.questions ==null?0:paper.questions!.length,
    });

    for(var questions in paper.questions!){
    final questionPath=  QuestionRF(paperId: paper.id, questionsId: questions.id);
    batch.set(questionPath, {
      "question":questions.question,
      "correct_answer":questions.correctAnswer
    });

    for(var answer in questions.answers){
      batch.set(questionPath.collection("answers").doc(answer.identifier), {
        "identifier":answer.identifier,
        "Answer":answer.answer
      });
    }
    }

    
  }

  
  await batch.commit();

  loadingStatus.value = LoadingStatus.completed; //value =1

  
  }

  //print('Items number is == ${questionpapers[0].description}');
}