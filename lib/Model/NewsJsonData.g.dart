// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NewsJsonData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsData _$NewsDataFromJson(Map<String, dynamic> json) {
  return NewsData(
    json['resultCode'] as String?,
    json['totalCount'] as int?,
    json['pageNo'] as int?,
    (json['items'] as List<dynamic>?)
        ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['numOfRows'] as int?,
    json['resultMsg'] as String?,
  );
}

Map<String, dynamic> _$NewsDataToJson(NewsData instance) => <String, dynamic>{
      'resultCode': instance.resultCode,
      'totalCount': instance.totalCount,
      'pageNo': instance.pageNo,
      'items': instance.items,
      'numOfRows': instance.numOfRows,
      'resultMsg': instance.resultMsg,
    };
