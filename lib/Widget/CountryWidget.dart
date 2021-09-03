import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:personalproj/Controller/HomeController.dart';

class CountryWidget extends StatelessWidget {
  const CountryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    return InkWell(onTap: (){ homeController.selectFilter(2); },
      child: Obx(() =>
          AnimatedContainer(
            margin: EdgeInsets.only(bottom : homeController.countryHeight.value ?  window.physicalSize.height : 0),
            duration: Duration(milliseconds: 300), height: homeController.countryHeight.value ? window.physicalSize.height : 50,
            child: Stack(
              children: [
                Row(
                  children: [
                    homeController.countryHeight.value ? AnimatedOpacity(duration: Duration(milliseconds: 500),
                        opacity: homeController.countryHeight.value ? 1.0 : 0,
                        child: IconButton(onPressed: () { homeController.selectFilter(0); }, icon: Icon(Icons.arrow_back_ios_rounded),)) : Container(height: 50, width: 50,),
                    Container(margin: EdgeInsets.only(left: homeController.countryHeight.value ? 0 : 0), child: Text(homeController.selectedCountry.value.length > 1 ? homeController.selectedCountry.value : 'country', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800),)),
                  ],
                ),
                homeController.countryHeight.value ?
                AnimatedContainer(
                    margin: EdgeInsets.only(top: 50,),
                    duration: Duration(milliseconds: 300),
                    height: homeController.countryHeight.value ? double.infinity : 0,
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 300),
                      opacity: homeController.countryHeight.value ? 1.0 : 0.0,
                      child: GridView.count(
                        crossAxisCount: 4,
                        children: List.generate(countryList.length, (index) => countryList[index])

                      ),
                    )) : Container(),
              ],
            ),
          ),
      ),
    );
  }
}
