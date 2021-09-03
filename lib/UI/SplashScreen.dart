import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personalproj/Controller/SplashController.dart';

class SplashScreen extends StatelessWidget {

  final splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff492ddd),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              splashImage(),
              const SizedBox(
                height: 10,
              ),
              splashText(),
            ],
          ),
        ),
        bottomNavigationBar: Container(margin: EdgeInsets.only(bottom: 20), child: Image.asset('image/SplashImage2.png', height: 30, color: Colors.white,),)
    );
  }

  Widget splashText(){
    return Obx (() => AnimatedOpacity(
      opacity: splashController.visibleText.value ? 1.0 : 0.0,
      duration: Duration(milliseconds: 700),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(child: Text('NewsBoard', style: TextStyle( color: Colors.white, fontSize: 40, fontFamily: 'BebasNeue'), textAlign: TextAlign.right, ),),
          ],
        ),
      ),
    ),
    );
  }

  Widget splashImage(){
    return Obx (() =>  AnimatedOpacity(
        opacity: splashController.visibleImage.value ? 1.0 : 0.0,
        duration: Duration(milliseconds: 700),
        child: Image.asset('image/SplashImage1.png', width: 100, height: 100, color: Colors.white,)));
  }

}
