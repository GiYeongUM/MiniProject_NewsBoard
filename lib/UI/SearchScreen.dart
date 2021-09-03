import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personalproj/Controller/HomeController.dart';
import 'package:personalproj/Controller/SearchController.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchController = Get.put(SearchController());
    final homeController = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff492ddd),
        title: Text('Search', style: TextStyle( color: Colors.white, fontSize: 25, fontFamily: 'BebasNeue'), ),
      ),
      body: SingleChildScrollView(
        controller: searchController.scrollController.value,
        child: Stack(
          children: [
            Column(
              children: [
                new FutureBuilder<String>(
                  future: searchController.searchNews(homeController.searchedKeyword.value, homeController.selectedCountry.value.length > 1, homeController.selectedCountry.value, 1),
                    builder: (context, snapshot) {
                    if (snapshot.hasError) {
                        print(snapshot.error);
                        return Container();
                    }
                    else if(snapshot.hasData){
                      if(snapshot.data == 'success'){
                        return Obx(()=> ListView(
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            children: List.generate(searchController.newsWidgetList.length, (index) => searchController.newsWidgetList[index])
                        ));
                      }
                      else if(snapshot.data == 'none') {
                        return Container(child: Center(child: Text('검색 결과가 없습니다.'),),);
                      }
                      else {
                        return Container(child: Center(child: Text('검색 오류'),),);
                      }
                    }
                    else {
                      return Container(margin: EdgeInsets.all(30), child: Center(child: CircularProgressIndicator()));
                    }
                   },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
