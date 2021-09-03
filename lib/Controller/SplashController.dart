import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:personalproj/UI/HomeScreen.dart';
import '../../Url.dart';

class SplashController extends GetxController {
  var visibleText = false.obs;

  var visibleImage = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    setVisibilityImage();
    setVisibilityText();
    try {
      var request = http.Request('GET', Uri.parse(Url.url));
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        Future.delayed(const Duration(seconds: 2), () {
          Get.off(() => HomeScreen());
        });
      } else {
        Get.defaultDialog(
          title: 'Alert',
          middleText: 'Sorry, the server is not responding.',
          textConfirm: "Close",
          confirmTextColor: Colors.red
        );
      }
    } catch (e) {
      Get.defaultDialog(
          title: 'Alert',
          middleText: 'Sorry, the server is not responding.',
          textConfirm: "Close",
          confirmTextColor: Colors.red
      );
    }

    super.onReady();
  }

  void setVisibilityImage() {
    Future.delayed(const Duration(milliseconds: 100), () {
      visibleImage.value = true;
    });
  }

  void setVisibilityText() {
    Future.delayed(const Duration(milliseconds: 800), () {
      visibleText.value = true;
    });
  }

  void onClose() {
    print('onClose splash');
    super.onClose();
  }
}
