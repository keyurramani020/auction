import 'package:btt/View/Utilites/Colors.dart';
import 'package:btt/View/Utilites/imagepath.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widget/widget.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({super.key});

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  bool tab1 = false;
  bool tab2 = false;

  @override
  Widget build(BuildContext context) {
    //final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: colors.background,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset(paths.verify),
              SizedBox(
                width: widths,
                height: 30,
              ),
              SizedBox(width: widths * 0.8, child: Image.asset(paths.verify1)),
              SizedBox(
                width: widths,
                height: 30,
              ),
              const Text(
                "Upload your documents",
                style: TextStyle(
                    color: colors.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: widths,
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (tab1) {
                      tab1 = false;
                    } else {
                      tab1 = true;
                    }
                  });
                },
                child: Container(
                  height: 50,
                  width: widths * 0.8,
                  decoration: BoxDecoration(
                      color: colors.primary2,
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    children: [
                      sbw(30.0),
                      const Text("Pan Card "),
                      const Text(
                        "*",
                        style: TextStyle(color: Colors.red),
                      ),
                      SizedBox(
                        width: widths * 0.4,
                      ),
                      const Icon(Icons.keyboard_arrow_up),
                      sbw(20.0),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: widths,
                height: 20,
              ),
              tab1
                  ? SizedBox(
                      width: widths * 0.5,
                      child: Image.asset(paths.Select),
                    )
                  : Container(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (tab2) {
                      tab2 = false;
                    } else {
                      tab2 = true;
                    }
                  });
                },
                child: Container(
                  height: 50,
                  width: widths * 0.8,
                  decoration: BoxDecoration(
                      color: colors.primary2,
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    children: [
                      sbw(30.0),
                      const Text("Adhar Card "),
                      const Text(
                        "*",
                        style: TextStyle(color: Colors.red),
                      ),
                      SizedBox(
                        width: widths * 0.38,
                      ),
                      const Icon(Icons.keyboard_arrow_up),
                      sbw(20.0),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: widths,
                height: 20,
              ),
              tab2
                  ? SizedBox(
                      width: widths * 0.5,
                      child: Image.asset(paths.Select),
                    )
                  : Container(),
              Container(
                width: widths * 0.8,
                height: 50,
                decoration: BoxDecoration(
                    color: colors.primary,
                    borderRadius: BorderRadius.circular(30)),
                child: TextButton(
                  onPressed: () {
                    Get.toNamed("/verifyed");
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Upload",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: widths,
                height: 20,
              ),
              Container(
                  width: widths * 0.7,
                  alignment: Alignment.center,
                  child: const Text("Skip now")),
            ],
          ),
        ),
      ),
    );
  }
}
