import 'package:json_annotation/json_annotation.dart';
part 'NewsItemsJsonData.g.dart';



@JsonSerializable()
class Items {

  Items( this.bbstxSnDatatype,
         this.newsTitl,
         this.newsWrterNmDatatype,
         this.natnDatatype,
         this.indstClDatatype,
         this.regnDatatype,
         this.kotraNewsUrlDatatype,
         this.regDtDatatype,
         this.crrspOvrofLink,
         this.newsBdtDatatype,
         this.indstCl,
         this.newsBdt,
         this.newsWrtDt,
         this.newsTitlDatatype,
         this.bbstxSn,
         this.inqreCnt,
         this.infoCl,
         this.updDtDatatype,
         this.natn,
         this.inqryItmLinkDatatype,
         this.infoClDatatype,
         this.kotraNewsUrl,
         this.newsWrtDtDatatype,
         this.inqreCntDatatype,
         this.kwrdDatatype,
         this.kwrd,
         this.regn,
         this.regDt,
         this.newsBdtDatanotice,
         this.cntntSumar,
         this.ovrofInfoDatatype,
         this.ovrofInfo,
         this.inqryItmLink,
         this.newsWrterNm,
         this.updDt,
         this.cntntSumarDatatype,
         this.crrspOvrofLinkDatatype);
  
   String? bbstxSnDatatype;
   String? newsTitl;
   String? newsWrterNmDatatype;
   String? natnDatatype;
  String? indstClDatatype;
   String? regnDatatype;
   String? kotraNewsUrlDatatype;
   String? regDtDatatype;
   String? crrspOvrofLink;
   String? newsBdtDatatype;
   String? indstCl;
   String? newsBdt;
   String? newsWrtDt;
   String? newsTitlDatatype;
  String? bbstxSn;
   String? inqreCnt;
   String? infoCl;
   String? updDtDatatype;
   String? natn;
   String? inqryItmLinkDatatype;
   String? infoClDatatype;
    String? kotraNewsUrl;
   String? newsWrtDtDatatype;
   String? inqreCntDatatype;
   String? kwrdDatatype;
   String? kwrd;
   String? regn;
    String? regDt;
   String? newsBdtDatanotice;
    String? cntntSumar;
    String? ovrofInfoDatatype;
   String? ovrofInfo;
   String? inqryItmLink;
   String? newsWrterNm;
   String? updDt;
   String? cntntSumarDatatype;
   String? crrspOvrofLinkDatatype;



  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);
  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}
