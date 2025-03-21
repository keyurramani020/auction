import 'package:btt/Apiservice/apiservice.dart';
import 'package:btt/controller/homecontroller.dart';
import 'package:btt/model/ViewBiddermodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../View/Utilites/strings.dart';

class profileController extends GetxController {
  var Response = ViewBidder().obs;
  var loading = false.obs;
  var email = TextEditingController();
  var pass = TextEditingController();
  var loginf = false.obs;

  var context;
  profileController({required this.context});
  Future<void> getprofile() async {
    try {
      loading(true);
      final res = await Apiservice().bidderprofile();
      final get = Get.put(homeController(context: context!));
      if (res.statusCode == 200) {
        Response(res);
        loginf(true);
        final shared = await SharedPreferences.getInstance();

        shared.setString(emails, res.responseData!.email.toString());
      }
    } catch (e) {
      Get.back();
    } finally {
      loading(false);
    }
  }
}
