import 'package:cloud_firestore/cloud_firestore.dart';

final fireStore = FirebaseFirestore.instance;
final questionPaperRF = fireStore.collection('questionpapers');

DocumentReference QuestionRF({
  required String paperId,
  required String questionsId,
})=>questionPaperRF.doc(paperId).collection("questions").doc(questionsId);