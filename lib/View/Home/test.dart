import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/homecontroller.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    final get = Get.put(homeController(context: context));
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            get.viewbiddierlinks();
          },
          child: Text("test"),
        ),
      ),
    );
  }
}
