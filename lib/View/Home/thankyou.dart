import 'package:btt/View/Utilites/Colors.dart';
import 'package:btt/View/Utilites/imagepath.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThankYou extends StatefulWidget {
  const ThankYou({super.key});

  @override
  State<ThankYou> createState() => _ThankYouState();
}

class _ThankYouState extends State<ThankYou> {
  @override
  Widget build(BuildContext context) {
    final widths = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: colors.background,
      body: Center(
        child: Column(
          children: [
            Image.asset(paths.verify),
            SizedBox(
              width: widths,
              height: 30,
            ),
            TextButton(
                onPressed: () {
                  Get.toNamed("/home");
                },
                child: Image.asset(paths.verifyed))
          ],
        ),
      ),
    );
  }
}
