import 'package:btt/View/Utilites/Colors.dart';
import 'package:btt/View/Utilites/imagepath.dart';
import 'package:btt/controller/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widget/widget.dart';

class TermsConditions extends StatefulWidget {
  const TermsConditions({super.key});

  @override
  State<TermsConditions> createState() => _TermsConditionsState();
}

class _TermsConditionsState extends State<TermsConditions> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  Future<void> toast(String so) async {}

  @override
  Widget build(BuildContext context) {
    final widths = MediaQuery.of(context).size.width;
    //final heights = MediaQuery.of(context).size.height;
    final get = Get.put(homeController(context: context));
    final bidTerm = Get.arguments['bidTerm'];
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              sbh(50.0),
              SizedBox(
                width: widths * 0.9,
                height: 50,
                child: Row(
                  children: [
                    sbw(20.0),
                    Image.asset(
                      paths.logo,
                      scale: 4,
                    ),
                    sbw(widths * 0.5),
                    IconButton(
                      onPressed: () {
                        Get.toNamed("/profile");
                      },
                      icon: Image.asset(
                        paths.Ellipse4,
                        scale: 4,
                      ),
                    )
                  ],
                ),
              ),
              sbh(100),
              Obx(() {
                return get.loading3.value == true
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: colors.primary,
                        ),
                      )
                    : Container(
                        padding: const EdgeInsets.all(25),
                        width: widths * 0.8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
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
                          children: [
                            sbh(10.0),
                            const Text(
                              "Terms & Conditions",
                              style: TextStyle(
                                  color: colors.primary,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            sbh(20.0),
                            Text(
                              bidTerm,
                              textAlign: TextAlign.justify,
                            ),
                            sbh(10.0),
                            // Text(
                            //     textAlign: TextAlign.justify,
                            //     "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                            // SizedBox(
                            //   height: 20,
                            // ),
                            SizedBox(
                              width: widths * 0.8,
                              child: Row(
                                children: [
                                  Container(
                                      width: 30,
                                      height: 30,
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: colors.primary2),
                                      child: const Icon(
                                        Icons.check,
                                        color: colors.primary,
                                      )),
                                  sbw(10.0),
                                  const Text(
                                    "Your agreement",
                                    style: TextStyle(fontSize: 14),
                                  )
                                ],
                              ),
                            ),
                            sbh(10.0),
                            SizedBox(
                              width: widths * 0.8,
                              child: Row(
                                children: [
                                  Container(
                                      width: 30,
                                      height: 30,
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: colors.primary2),
                                      child: const Icon(
                                        Icons.check,
                                        color: colors.primary,
                                      )),
                                  sbw(10.0),
                                  const Text(
                                    "Privacy",
                                    style: TextStyle(fontSize: 14),
                                  )
                                ],
                              ),
                            ),
                            sbh(10.0),
                            SizedBox(
                              width: widths * 0.8,
                              child: Row(
                                children: [
                                  Container(
                                      width: 30,
                                      height: 30,
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: colors.primary2),
                                      child: const Icon(
                                        Icons.check,
                                        color: colors.primary,
                                      )),
                                  sbw(10.0),
                                  const Text(
                                    "Linked Sites",
                                    style: TextStyle(fontSize: 14),
                                  )
                                ],
                              ),
                            ),
                            sbh(20.0),
                            SizedBox(
                              width: widths * 0.78,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: widths * 0.25,
                                    height: 40,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text(
                                        "Cancel",
                                        style: TextStyle(color: colors.primary),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: widths * 0.25,
                                    height: 40,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: colors.primary,
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: TextButton(
                                      onPressed: () async {
                                        get.Termsauctioniagree();
                                      },
                                      child: const Text(
                                        "Agree",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            sbh(10.0),
                          ],
                        ),
                      );
              })
            ],
          ),
        ),
      ),
    );
  }
}
