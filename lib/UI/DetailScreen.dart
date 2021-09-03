import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var htmlsource = Get.arguments;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xff492ddd),
          title: Text(
            'NewsBoard',
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontFamily: 'BebasNeue'),
          ),
        ),
        body: SingleChildScrollView(
          child: Html(data: htmlsource,
            style: {
              "tr": Style(
                border: Border(bottom: BorderSide(color: Colors.grey)),
              ),
              "th": Style(
                padding: EdgeInsets.all(6),
                backgroundColor: Colors.grey,
              ),
              "td": Style(
                padding: EdgeInsets.all(6),
                alignment: Alignment.topLeft,
              ),
              'h5': Style(maxLines: 2, textOverflow: TextOverflow.ellipsis),
            },
            customRender: {
              "table": (context, child) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child:
                  (context.tree as TableLayoutElement).toWidget(context),
                );
              },
              "flutter": (RenderContext context, Widget child) {
                return FlutterLogo(
                  style: (context.tree.element!.attributes['horizontal'] != null)
                      ? FlutterLogoStyle.horizontal
                      : FlutterLogoStyle.markOnly,
                  textColor: context.style.color!,
                  size: context.style.fontSize!.size! * 5,
                );
              },
            },),
        ));
  }
}
