import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:quesapp/controllers/question_paper/data_uploader.dart';
import 'package:quesapp/firebase_rsf/loading_status.dart';

class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({Key? key}) : super(key: key);
  DataUploader controller = Get.put(DataUploader());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quiz App'),),
      body: Center(
        child: Container(
          child: Obx(()=>Text(controller.loadingStatus.value==LoadingStatus.completed? "Uploading Complated":"uploading")),
        ),
      ),
    );
  }
}