import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personalproj/Controller/HomeController.dart';
import 'package:personalproj/Controller/SearchController.dart';
import 'package:personalproj/Widget/ContinentWidget.dart';
import 'package:personalproj/Widget/CountryWidget.dart';
import 'package:personalproj/Widget/SearchWidget.dart';

import 'SearchScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    HomeController homeController = Get.put(HomeController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff492ddd),
        title: Text('NewsBoard', style: TextStyle( color: Colors.white, fontSize: 25, fontFamily: 'BebasNeue'), ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(margin: EdgeInsets.symmetric(vertical: 7), child: ContinentWidget()),
            Container(margin: EdgeInsets.symmetric(vertical: 7), child: CountryWidget(),),
            Container(margin: EdgeInsets.symmetric(vertical: 7), child: SearchWidget(),),
          ],
        ),
      ),
      bottomSheet: InkWell(
        onTap: (){
          if(homeController.searchedKeyword.value.length > 1){
            Get.to(() => SearchScreen());
          }
          else{

          }
        },
        child: Container(
          color: Color(0xff492ddd),
          width: double.infinity,
          height: 80,
          child: Center(child: Text('검색', style: TextStyle(color:Colors.white , fontSize: 25, fontWeight: FontWeight.bold),)),
        ),
      ),
    );
  }
}
