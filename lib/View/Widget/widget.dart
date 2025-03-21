import 'package:btt/View/Utilites/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/profilecontroller.dart';
import '../Utilites/imagepath.dart';

Future<void> toast(String so) async {
  Get.snackbar("", "",
      backgroundColor: colors.secondary,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
      titleText: Text(
        so,
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: colors.primary, fontSize: 18, fontWeight: FontWeight.bold),
      ));
}

Future<void> toastcenter(String so) async {
  Get.snackbar("", "",
      backgroundColor: colors.secondary,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 2),
      titleText: Text(
        so,
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: colors.primary, fontSize: 18, fontWeight: FontWeight.bold),
      ));
}

void loding(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return PopScope(
          onPopInvoked: (bool didPop) async {
            if (didPop) {
              return;
            }
          },
          child: const Center(
            child: CircularProgressIndicator(
              color: colors.primary,
            ),
          ),
        );
      });
}

Widget cappbar(BuildContext context, widths, String pagename) {
  return SizedBox(
    width: widths * 0.9,
    height: 50,
    child: Stack(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: IconButton(
              onPressed: () {
                Get.toNamed(pagename);
              },
              icon: Icon(Icons.arrow_back_ios_sharp)),
        ),
        // TextButton(
        //   onPressed: () {
        //     Get.toNamed(pagename);
        //   },
        //   child: Container(
        //     width: 60,
        //     child:,
        //   ),
        // ),
        Container(
          alignment: Alignment.centerRight,
          child: IconButton(
            onPressed: () {
              final get1 = Get.put(profileController(context: context));
              get1.getprofile();
              Get.toNamed("/profile");
            },
            icon: Image.asset(
              paths.Ellipse4,
              scale: 4,
            ),
          ),
        )
      ],
    ),
  );
}

Widget sbh(double h) {
  return SizedBox(
    height: h,
  );
}

Widget sbw(double w) {
  return SizedBox(
    width: w,
  );
}

Widget sbhw(double h, double w) {
  return SizedBox(
    height: h,
    width: w,
  );
}
