import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:personalproj/Model/NewsItemsJsonData.dart';
import 'package:personalproj/Model/NewsJsonData.dart';
import 'package:personalproj/UI/DetailScreen.dart';
import 'package:personalproj/UI/SearchScreen.dart';

import '../Url.dart';
import 'HomeController.dart';

class SearchController extends GetxController {
  final homeController = Get.find<HomeController>();

  List<Items> newsList = <Items>[].obs;
  List<Widget> newsWidgetList = <Widget>[].obs;

  var searchPage = 1.obs;
  var isOver10 = false.obs;
  var scrollController = ScrollController().obs;

  @override
  void onInit() {
    newsWidgetList.clear();
    this.scrollController.value.addListener(() async {
      if ((this.scrollController.value.position.pixels.toInt() > (this.scrollController.value.position.maxScrollExtent - 340)) && isOver10.value) {
        searchPage.value++;
        print('scroll' + '  ' + searchPage.value.toString());
        isOver10.value = false;
        await searchNews(homeController.searchedKeyword.value, homeController.selectedCountry.value.length > 1, homeController.selectedCountry.value, searchPage.value);

      }
      super.onInit();
    });
  }

  Future<String> searchNews(String searchData, bool isCountry, String country, int pageNum) async {
    try {
      if (isCountry) {
        var request = http.MultipartRequest(
            'GET',
            Uri.parse(
                'http://apis.data.go.kr/B410001/ovseaMrktNewsService/ovseaMrktNews?ServiceKey=DHXZ3wBl8klRLofm0ZCpYAyuI5flHFVpPiLAlZLD0/ejkkDhIGoAmKB/KaJlBB9gPxFAgcaj3t4z4YxUb7oduA==&type=json&numOfRows=30&pageNo=' +
                    pageNum.toString() +
                    '&search1=' +
                    country +
                    '&search5=' +
                    searchData));
        // request.fields.addAll(
        //     {
        //       // 'ServiceKey': Url.serviceKey,
        //       'search1': country,
        //       'search2': searchData
        //     });
        http.StreamedResponse response = await request.send();
        if (response.statusCode == 200) {
          String responseStream = await response.stream.bytesToString();
          final parsed = json.decode(responseStream);
          Map searchresult = jsonDecode(responseStream);
          NewsData newsData = NewsData.fromJson(parsed);
          print(responseStream);
          if (newsData.resultCode == '00') {
            newsData.items!.length == 30 ? isOver10.value = true : isOver10.value = false;
            print(isOver10.value);
            for (int i = 0; i < newsData.items!.length; i++) {
              newsList.insert(i, newsData.items![i]);
              newsWidgetList.add(_widgetNewsCard(newsList[i]));
              print(newsList[i].newsTitl);
            }
            return 'success';
          } else {
            print('none');
            return 'none';
          }
        } else {
          print('fail');
          return 'fail';
        }
      } else {
        var request = http.MultipartRequest(
            'GET',
            Uri.parse(
                'http://apis.data.go.kr/B410001/ovseaMrktNewsService/ovseaMrktNews?ServiceKey=DHXZ3wBl8klRLofm0ZCpYAyuI5flHFVpPiLAlZLD0/ejkkDhIGoAmKB/KaJlBB9gPxFAgcaj3t4z4YxUb7oduA==&type=json&numOfRows=30&pageNo=' +
                    pageNum.toString() +
                    '&search1=' +
                    country +
                    '&search5=' +
                    searchData));
        http.StreamedResponse response = await request.send();
        if (response.statusCode == 200) {
          String responseStream = await response.stream.bytesToString();
          final parsed = json.decode(responseStream);
          Map searchresult = jsonDecode(responseStream);
          NewsData newsData = NewsData.fromJson(parsed);
          print(responseStream);
          if (newsData.resultCode == '00') {
            newsData.items!.length == 30 ? isOver10.value = true : isOver10.value = false;
            print(isOver10.value);
            for (int i = 0; i < newsData.items!.length; i++) {
              newsList.insert(i, newsData.items![i]);
              newsWidgetList.add(_widgetNewsCard(newsList[i]));
              print(newsList[i].newsTitl);
            }
            return 'success';
          } else {
            print('none');
            return 'none';
          }
        } else {
          print('fail');
          return 'fail';
        }
      }
    } catch (e) {
      print('exc');
      return 'exception';
    }
  }

  Widget _widgetNewsCard(Items newsitems) {
    return Container(
      width: double.infinity,
      height: 150,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: InkWell(
        onTap: () {
          Get.to(() => DetailScreen(), arguments: newsitems.newsBdt);
        },
        child: Card(
          elevation: 2,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Material(
                      type: MaterialType.transparency,
                      child: Text(
                        newsitems.newsTitl!,
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Container(
                    child: Material(
                      type: MaterialType.transparency,
                      child: Text(
                        newsitems.cntntSumar!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w800,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 7.0),
                  Text(
                    newsitems.newsWrterNm! + ' 기자',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 7.0),
                  Text(
                    newsitems.newsWrtDt!.split(' ')[0],
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onClose() {
    print('onClose search');
    super.onClose();
  }
}
