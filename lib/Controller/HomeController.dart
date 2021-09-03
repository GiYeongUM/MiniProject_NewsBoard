import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personalproj/Model/CountryList.dart';

List<Widget> countryList = [TextButton(onPressed: () {  }, child: Text(''), )];

class HomeController extends GetxController {

  // 애니메이션용 컨테이너 선택여부
  RxBool continentHeight = false.obs;
  RxBool countryHeight = false.obs;
  RxBool keywordHeight = false.obs;

  // 검색 데이터
  var selectedContinent = ''.obs;
  var selectedCountry = ''.obs;
  var searchedKeyword = ''.obs;

  // 필터 적용 여부
  RxBool checkContinent = RxBool(false);
  RxBool checkCountry = RxBool(false);
  RxBool checkKeyword = RxBool(false);

  TextEditingController textEditingController = TextEditingController();


  void selectFilter(int number){
    switch(number){
      case 1:
        continentHeight.value = true;
        countryHeight.value = false;
        keywordHeight.value = false;
        break;
      case 2:
        continentHeight.value = false;
        countryHeight.value = true;
        keywordHeight.value = false;
        break;
      case 3:
        continentHeight.value = false;
        countryHeight.value = false;
        keywordHeight.value = true;
        break;
      default:
        continentHeight.value = false;
        countryHeight.value = false;
        keywordHeight.value = false;
        break;
    }
  }

  void makeCountryList(String continent){
    countryList.clear();
    switch(continent){
      case '유럽':
        for(int i = 0; i < europe.length; i++){
          countryList.add(TextButton(onPressed: () { selectedCountry.value = europe[i]; selectFilter(3);}, child: Text(europe[i], style: TextStyle(color: Colors.black)), ));
        }
        selectFilter(2);
        break;
      case '아시아':
        for(int i = 0; i < asia.length; i++){
          countryList.add(TextButton(onPressed: () { selectedCountry.value = asia[i]; selectFilter(3);}, child: Text(asia[i], style: TextStyle(color: Colors.black)), ));
        }
        selectFilter(2);
        break;
      case '북미':
        for(int i = 0; i < northAmerica.length; i++){
          countryList.add(TextButton(onPressed: () { selectedCountry.value = northAmerica[i]; selectFilter(3);}, child: Text(northAmerica[i], style: TextStyle(color: Colors.black)), ));
        }
        selectFilter(2);
        break;
      case '중남미':
        for(int i = 0; i < southAmerica.length; i++){
          countryList.add(TextButton(onPressed: () { selectedCountry.value = southAmerica[i]; selectFilter(3);}, child: Text(southAmerica[i],style: TextStyle(color: Colors.black)), ));
        }
        selectFilter(2);
        break;
      case '아프리카':
        for(int i = 0; i < africa.length; i++){
          countryList.add(TextButton(onPressed: () { selectedCountry.value = africa[i]; selectFilter(3);}, child: Text(africa[i], style: TextStyle(color: Colors.black),), ));
        }
        selectFilter(2);
        break;
      case '오세아니아':
        for(int i = 0; i < oceania.length; i++){
          countryList.add(TextButton(onPressed: () { selectedCountry.value = oceania[i]; selectFilter(3);}, child: Text(oceania[i], style: TextStyle(color: Colors.black)), ));
        }
        selectFilter(2);
        break;
    }
  }

}