
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();

  @override
  void onReady() {
      
    super.onReady();
  }

  void toggleDrawer() {
    print("Toggle drawer");
    zoomDrawerController.toggle?.call();
    update();
  }

  void singIn(){

  }

  void singOut(){

  }

  void website(){

  }

  void email(){
   final Uri emailLaunchUri= Uri(
      scheme: 'mailto',
      path: 'info@gmal.com'

    );

    _launch(emailLaunchUri.toString());


  }

  Future<void> _launch(String url)async{
    if (!await launch(url)) {
      throw 'Could not Launch $url ' ;
    }
  }

 
}