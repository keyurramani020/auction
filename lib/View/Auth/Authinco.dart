import 'package:btt/View/Utilites/Colors.dart';
import 'package:btt/View/Utilites/imagepath.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widget/widget.dart';

class Authenticationincomplete extends StatefulWidget {
  const Authenticationincomplete({super.key});

  @override
  State<Authenticationincomplete> createState() =>
      _AuthenticationincompleteState();
}

class _AuthenticationincompleteState extends State<Authenticationincomplete> {
  @override
  Widget build(BuildContext context) {
    final widths = MediaQuery.of(context).size.width;
    // final heights = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset(paths.verify),
            SizedBox(
              width: widths,
              height: 30,
            ),
            Image.asset(
              paths.oops,
              scale: 4,
            ),
            sbh(60.0),
            Container(
              width: widths * 0.8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(3, 3),
                      blurRadius: 30,
                      spreadRadius: 30,
                      color: Color.fromRGBO(80, 85, 141, 0.14901960784313725),
                    )
                  ]),
              child: Column(
                children: [
                  sbh(30.0),
                  const Text(
                      textAlign: TextAlign.center,
                      "Authentication is incomplete, To continue the process, Kindly complete your authentication"),
                  sbh(20.0),
                  Container(
                    width: widths * 0.4,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: colors.primary,
                        borderRadius: BorderRadius.circular(25)),
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed("/login");
                      },
                      child: const Text(
                        "Authentication",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  sbh(20.0),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
