import 'package:btt/Apiservice/apiservice.dart';
import 'package:btt/View/Widget/widget.dart';
import 'package:btt/controller/homecontroller.dart';
import 'package:btt/model/Loginmodel.dart';
import 'package:btt/model/changepasswordmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../View/Utilites/strings.dart';

class loginController extends GetxController {
  var Response = LoginModel().obs;
  var Response1 = changepassword().obs;
  var loading = false.obs;
  var loading1 = false.obs;
  var email = TextEditingController();
  var pass = TextEditingController();
  var loginf = false.obs;
  var remebermme = false.obs;

  var context;
  loginController({required this.context});
  Future<void> checkuser() async {
    final shared = await SharedPreferences.getInstance();
    if (shared.getString(emails) != null) {
      email.text = shared.getString(emails).toString();
      pass.text = shared.getString(password).toString();

      if (shared.getString(remeberme) != null) {
        remebermme(bool.parse(shared.getString(remeberme).toString()));
      }
    }
  }

  Future<void> login() async {
    try {
      loading(true);
      loding(context!);
      final res = await Apiservice().login(email.text, pass.text);
      final get = Get.put(homeController(context: context!));
      if (res.responseData?.userId != null && res.statusCode == 200) {
        print("sdhv");
        Response(res);
        loginf(true);
        final shared = await SharedPreferences.getInstance();
        if (remebermme.value == true) {
          shared.setString(emails, email.text);
          shared.setString(password, pass.text);
        }
        print("userId" + res.responseData!.userId.toString());
        shared.setString(userid, res.responseData!.userId.toString());
        shared.setString(bidderid, res.responseData!.userId.toString());
        shared.setString(usertypeId, res.responseData!.usertypeId.toString());
        shared.setString(
            trackLoginId, res.responseData!.trackLoginId.toString());
        shared.setString(token, res.responseData!.token.toString());
        shared.setString(clienid, "1");
        shared.setString(remeberme, remebermme.value.toString());
        toast(res.message.toString());

        email.clear();
        pass.clear();
        remebermme(false);
        get.auctionlist.clear();
        // get.Auctionlist();
        get.onInit();
        Get.toNamed("/home");
      } else {
        toast(res.message.toString());
      }
    } catch (e) {
      Get.back();
      print(e.toString());
    } finally {
      loading(false);
    }
  }

  Future<void> logout() async {
    try {
      final get = Get.put(homeController(context: context!));
      final shared = await SharedPreferences.getInstance();
      if (shared.getString(remeberme) != null &&
          shared.getString(remeberme).toString() != "false") {
        shared.remove(userid);
        shared.remove(usertypeId);
        shared.remove(trackLoginId);
        shared.remove(token);
      } else {
        print("clear");
        shared.clear();
      }
      checkuser();
      get.auctionlist.clear();
      Get.toNamed("/login");
    } catch (e) {
      Get.back();
      print(e.toString());
    } finally {
      loading(false);
    }
  }

  Future<void> ChangePassword(String oldpass, String newpass) async {
    try {
      loading1(true);
      final res = await Apiservice().Changepassword(oldpass, newpass);

      if (res.statusCode == 200) {
        print("sdhv");
        Response1(res);
        toast(res.message.toString());
      }
    } catch (e) {
      Get.back();
      print(e.toString());
    } finally {
      loading1(false);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    checkuser();
    super.onInit();
  }
}
