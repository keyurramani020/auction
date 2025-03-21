import 'package:btt/View/Utilites/Colors.dart';
import 'package:btt/View/Utilites/imagepath.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Verifyed extends StatefulWidget {
  const Verifyed({super.key});

  @override
  State<Verifyed> createState() => _VerifyedState();
}

class _VerifyedState extends State<Verifyed> {
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
