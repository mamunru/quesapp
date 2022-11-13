import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:quesapp/configs/themes/app_icons.dart';
import 'package:quesapp/configs/themes/ui_parameter.dart';
import 'package:quesapp/models/question_paper_model.dart';
import 'package:get/get.dart';
import 'package:quesapp/widgets/app_icon_text.dart';

import '../configs/themes/custome_text_style.dart';

class QuestionCard extends StatelessWidget {
  QuestionPaperModel model;
   QuestionCard({required this.model, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double _padding = 10.0;
    return Container(
      decoration: BoxDecoration(
        borderRadius: UIparamenters.cardBroderRadius,
        color: Theme.of(context).cardColor
      ),
      child: Padding(
        padding: const EdgeInsets.all(_padding),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ColoredBox(
                    color:Theme.of(context).primaryColor.withOpacity(0.1),

                    child: SizedBox(
                      height: Get.width*0.15,
                      width: Get.width*0.15,
                      child: CachedNetworkImage(
                        imageUrl: "https://firebasestorage.googleapis.com/v0/b/quiz-4a9d0.appspot.com/o/question_paper_images%2Fbiology.png?alt=media&token=770a55d5-0ed3-425f-bedb-09880178954a",
                        placeholder: (context,url)=>Container(
                          
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),

                        ),
                        errorWidget: (context,url,error)=>Image.asset("assets/images/app_splash_logo.png"),
                        )
                    ),
                  ),
                ),

                SizedBox(width: 12,),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(model.title,style: CartTitle(context),),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 15),
                        child: Text(model.description),
                      ),
                      Row(
                        children: [
                          AppIconText(
                            icon: Icon(Icons.help_center_rounded,
                             color: Get.isDarkMode?Colors.white:Theme.of(context).primaryColor,), 
                             text: Text(model.questionCount.toString()+' Questions', 
                             style: detailText.copyWith(
                              color:  Get.isDarkMode?Colors.white:Theme.of(context).primaryColor,
                             ),)),

                             SizedBox(width: 15,),

                             AppIconText(
                            icon: Icon(Icons.timer,
                             color: Get.isDarkMode?Colors.white:Theme.of(context).primaryColor,), 
                             text: Text(model.timeInMinits(), 
                             style: detailText.copyWith(
                              color:  Get.isDarkMode?Colors.white:Theme.of(context).primaryColor,
                             ),))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              bottom:- _padding,
              right: -_padding,
              child: GestureDetector(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 20),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(cardBroderRadius)
                  )
                ),
                child: Icon(AppIcons.trophyOutLine,),
              ),
            ))
          ],
        ),
      ),
    );
  }
}