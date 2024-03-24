import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tourism_app/Onboarding/onboarding_items.dart';
import 'package:tourism_app/constants/color.dart';
import 'package:tourism_app/pages/Auth/login.dart';
import 'package:tourism_app/pages/Auth/register.dart';
import 'package:tourism_app/pages/welcome.dart';
import 'package:tourism_app/utils/app_utils.dart';

class Onboardingview extends StatefulWidget {
  const Onboardingview({Key? key}) : super(key: key);

  @override
  State<Onboardingview> createState() => _OnboardingviewState();
}

class _OnboardingviewState extends State<Onboardingview> {
  final controller = onboardingItems();
  final pagecontroller = PageController();

  int nextButtonClickCount = 0;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [


            
            //SKIP Button
            TextButton(
              onPressed: () {
                gotoPageAndRemoveAll(RegisterPage(), context);
              },
              child: Text("Skip",style: TextStyle(color: AppColor.PrimaryColor),),
            ),



            //Indicator
            SmoothPageIndicator(
              controller: pagecontroller,
              count: controller.items.length,
              onDotClicked: (index) => pagecontroller.animateToPage(
                index,
                duration: Duration(microseconds: 600),
                curve: Curves.easeIn,
              ),
              effect: const WormEffect(
                dotHeight: 12,
                dotWidth: 12,
                activeDotColor: Color(0xff084296),
              ),
            ),



            //Next Button
            TextButton(
              onPressed: () {
                nextButtonClickCount++;
                pagecontroller.nextPage(
                  duration: Duration(milliseconds: 600),
                  curve: Curves.ease,
                );
                if (nextButtonClickCount == 4) {
                  gotoPageAndRemoveAll(RegisterPage(), context);
                }
              },
              child: Text("Next",style: TextStyle(color: AppColor.PrimaryColor),),
            ),
          ],
        ),
      ),
      
      
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: PageView.builder(
          onPageChanged: (index) {},
          itemCount: controller.items.length,
          controller: pagecontroller,
         
         
          itemBuilder: (context, Index) {
            
            
            return Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(height: 170),
                
                Image.asset(controller.items[Index].image,height: 250,width: 150,),
         
                
                Text(controller.items[Index].tittle,
                style: TextStyle(color: AppColor.PrimaryColor,
                fontWeight: FontWeight.bold,fontSize: 27),
                
                ),
                
                const SizedBox(height: 15),
                
                Text(controller.items[Index].description,
                style: TextStyle(fontSize: 16,color: AppColor.PrimaryColor),
                textAlign:TextAlign.center,),
              ],
            );



          },
        ),
      ),



    );

  }




}
