import 'package:btt/View/Utilites/Colors.dart';
import 'package:btt/View/Utilites/imagepath.dart';
import 'package:btt/controller/homecontroller.dart';
import 'package:btt/controller/logincontroller.dart';
import 'package:btt/controller/profilecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Utilites/strings.dart';
import '../Widget/widget.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   final get = Get.put(profileController(context: context));
    //   get.getprofile();
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    final get = Get.put(profileController(context: context));

    final get1 = Get.put(homeController(context: context));
    final get2 = Get.put(loginController(context: context));
    return Obx(() {
      return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: get.loading.value == true
                ? SizedBox(
                    width: widths * 0.8,
                    height: heights * 0.8,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: colors.primary,
                      ),
                    ),
                  )
                : Column(
                    children: [
                      Image.asset(paths.top),
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Image.asset(
                            paths.user,
                            scale: 4,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 160),
                            child: Text(
                              get.Response.value.responseData!.personName
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      sbh(30.0),
                      Container(
                        padding: const EdgeInsets.all(40),
                        width: widths,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(3, 3),
                                blurRadius: 30,
                                spreadRadius: 30,
                                color: Color.fromRGBO(
                                    80, 85, 141, 0.14901960784313725),
                              )
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            sbh(10.0),
                            const Text(
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14, color: colors.textcolor),
                                "Email"),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 16),
                                    get.Response.value.responseData!.email
                                        .toString()),
                                const Expanded(child: Text("")),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.edit)),
                              ],
                            ),
                            sbh(15.0),
                            const Text(
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14, color: colors.textcolor),
                                "Password"),
                            Row(
                              children: [
                                const Text(
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 16),
                                    "*******"),
                                const Expanded(child: Text("")),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.edit))
                              ],
                            ),
                            sbh(15.0),
                            const Text(
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14, color: colors.textcolor),
                                "Mobile Number"),
                            Row(
                              children: [
                                Text(
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 16),
                                    get.Response.value.responseData!.mobileNo
                                        .toString()),
                                const Expanded(child: Text("")),
                                IconButton(
                                    onPressed: () {
                                      Get.toNamed("/editprofile");
                                    },
                                    icon: const Icon(Icons.edit))
                              ],
                            ),
                            sbh(25.0),
                            Container(
                              height: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border: Border.all(color: colors.primary),
                                  borderRadius: BorderRadius.circular(25)),
                              child: TextButton(
                                onPressed: () async {
                                  final shared =
                                      await SharedPreferences.getInstance();
                                  if (shared.getString(remeberme) != null &&
                                      shared.getString(remeberme).toString() !=
                                          "false") {
                                    shared.remove(userid);
                                    shared.remove(usertypeId);
                                    shared.remove(trackLoginId);
                                    shared.remove(token);
                                  } else {
                                    // print("clear");
                                    shared.clear();
                                  }
                                  get2.checkuser();
                                  get1.auctionlist.clear();
                                  Get.toNamed("/login");
                                  get1.autobiddingstates.value = false;
                                },
                                child: const Text(
                                  "Log Out",
                                  style: TextStyle(color: colors.primary),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
          ),
        ),
      );
    });
  }
}
