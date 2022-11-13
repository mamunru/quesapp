import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:quesapp/configs/themes/app_colors.dart';
import 'package:quesapp/configs/themes/app_icons.dart';
import 'package:quesapp/configs/themes/custome_text_style.dart';
import 'package:quesapp/configs/themes/ui_parameter.dart';

import 'package:quesapp/controllers/question_paper_controller.dart';
import 'package:quesapp/controllers/zoom_drawer_controller.dart';
import 'package:quesapp/screen/home/menu_screen.dart';
import 'package:quesapp/widgets/app_circle_button.dart';
import 'package:quesapp/widgets/content_area.dart';

import '../../widgets/question_card.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';



class HomeScreen extends GetView<MyDrawerController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
      body: GetBuilder<MyDrawerController>(builder: (_){
        return ZoomDrawer(
          borderRadius: 50.0,
          showShadow: true,
          angle: 0.0,
          style: DrawerStyle.DefaultStyle,
          controller: _.zoomDrawerController,
          backgroundColor: Colors.white.withOpacity(.5),
          slideWidth: MediaQuery.of(context).size.width*.4,
        menuScreen: MenuScreen(),
        mainScreen:Container(
        decoration: BoxDecoration(gradient: mainGradient()),
        child: SafeArea(
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                  
              children: [
                //SizedBox(height: 15,),
                Padding(
                  padding:  EdgeInsets.all(mobileScreenPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppCircleButton(
                        onTap: controller.toggleDrawer,
                        child: Icon(AppIcons.menuLeft,))
                      ,const SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            const  Icon(AppIcons.peace,),
                            SizedBox(width: 15,),
                            Text(
                              'Hello ',
                              style: detailText.copyWith(
                                color: onSurfaceTextColor
                              ),
                            ),
                            
    
                          ],
                        ),
                      ),
    
                      Text(
                              'What do you want to Learn Today ',
                              style: headerText
                              )
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ContentAread(
                      addPadding: false,
                      child: Obx(()=>ListView.separated(
                        padding: UIparamenters.mobileScreenPassing,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index){
                
                          return QuestionCard(
                            model: _questionPaperController.allPapers[index]
                          );
                          // return ClipRect(
                          //   child: SizedBox(
                          //     height: 200,
                          //     width: 200,
                          //     child: Obx((() => CachedNetworkImage(
                          //        progressIndicatorBuilder: (contex,url,downloadProgress)=>Container(
                          //               alignment: Alignment.center,
                          //               child: CircularProgressIndicator(value: downloadProgress.progress),
                
                          //               ),
                          //               //errorWidget: (context,url,error)=>Image.asset("assets/images/app_splash_logo.png"),
                          //               imageUrl: _questionPaperController.allPapers[index].imageUrl!,
                          //       // placeholder: AssetImage("assets/images/app_splash_logo.png"), 
                          //       // image: NetworkImage(_questionPaperController.allPapers[index].imageUrl!)
                          //   )
                          //   ),
                          //   )
                          //   )
                          // );
                        },
                         separatorBuilder: (BuildContext context, int index){
                          return const SizedBox(height: 20);
                         },
                          itemCount:_questionPaperController.allPapers.length ),
                      
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
      ), 
      );
      },
      )
      );
  }
}