import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:personalproj/Controller/HomeController.dart';

class ContinentWidget extends StatelessWidget {
  const ContinentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    return InkWell(onTap: (){ homeController.selectFilter(1); },
      child: Obx(() =>
          AnimatedContainer(
            margin: EdgeInsets.only(bottom : homeController.continentHeight.value ?  window.physicalSize.height : 0),
            duration: Duration(milliseconds: 300), height: homeController.continentHeight.value ? window.physicalSize.height : 50,
            child: Stack(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    homeController.continentHeight.value ? AnimatedOpacity(duration: Duration(milliseconds: 500),
                        opacity: homeController.continentHeight.value ? 1.0 : 0,
                        child: IconButton(onPressed: () { homeController.selectFilter(0); }, icon: Icon(Icons.arrow_back_ios_rounded),)) : Container(height: 50, width: 50,),
                    Container(margin: EdgeInsets.only(left: homeController.continentHeight.value ? 0 : 0), child: Text(homeController.selectedContinent.value.length > 1 ? homeController.selectedContinent.value : 'continent', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800),)),
                    ],
                ),
                homeController.continentHeight.value ?
                AnimatedContainer(
                    margin: EdgeInsets.only(top: 80),
                    duration: Duration(milliseconds: 300),
                    height: homeController.continentHeight.value ? window.physicalSize.height : 0,
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 300),
                      opacity: homeController.continentHeight.value ? 1.0 : 0.0,
                      child: GridView.count(
                        crossAxisCount: 2,
                        children: [
                          IconButton(onPressed: (){homeController.selectedCountry.value = ''; homeController.selectedContinent.value = '북미'; homeController.makeCountryList('북미'); }, icon: Image.asset('image/NorthAmerica.png')),
                          IconButton(onPressed: (){homeController.selectedCountry.value = ''; homeController.selectedContinent.value = '중남미'; homeController.makeCountryList('중남미');  }, icon: Image.asset('image/SouthAmerica.png')),
                          IconButton(onPressed: (){homeController.selectedCountry.value = ''; homeController.selectedContinent.value = '유럽'; homeController.makeCountryList('유럽'); }, icon: Image.asset('image/Europe.png')),
                          IconButton(onPressed: (){homeController.selectedCountry.value = ''; homeController.selectedContinent.value = '아시아'; homeController.makeCountryList('아시아'); }, icon: Image.asset('image/Asia.png')),
                          IconButton(onPressed: (){homeController.selectedCountry.value = ''; homeController.selectedContinent.value = '아프리카'; homeController.makeCountryList('아프리카');  }, icon: Image.asset('image/Africa.png')),
                          IconButton(onPressed: (){homeController.selectedCountry.value = ''; homeController.selectedContinent.value = '오세아니아'; homeController.makeCountryList('오세아니아'); }, icon: Image.asset('image/Oceania.png')),
                        ],
                      ),
                    )) : Container(),
              ],
            ),
          ),
      ),
    );
  }
}
