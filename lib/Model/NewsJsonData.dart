import 'package:json_annotation/json_annotation.dart';

import 'NewsItemsJsonData.dart';
part 'NewsJsonData.g.dart';

@JsonSerializable()
class NewsData {
  NewsData(this.resultCode, this.totalCount, this.pageNo, this.items, this.numOfRows, this.resultMsg);

  String? resultCode;
  int? totalCount;
  int? pageNo;
  List<Items>? items;
  int? numOfRows;
  String? resultMsg;

  factory NewsData.fromJson(Map<String, dynamic> json) => _$NewsDataFromJson(json);

  Map<String, dynamic> toJson() => _$NewsDataToJson(this);
}

