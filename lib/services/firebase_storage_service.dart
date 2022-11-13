import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';

Reference get firebaseStorage => FirebaseStorage.instance.ref();
class FirebaseStorageServices extends GetxService{

 Future<String?> getImage(String? imgName)async{
    if(imgName == null){
      return null;
    }
    try {
    var urlRef=  firebaseStorage.child("question_paper_images").child('/${imgName.toLowerCase()}.png');
    var imgurl = await urlRef.getDownloadURL();
   // print(urlRef);
    return imgurl;
    } catch (e) {
      print(e);
      return null;
    }
  }
}