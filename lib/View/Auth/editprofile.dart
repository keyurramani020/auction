import 'package:btt/View/Utilites/Colors.dart';
import 'package:btt/View/Utilites/imagepath.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widget/widget.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool tab = true;
  @override
  Widget build(BuildContext context) {
    //final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset(paths.top),
              InkWell(
                  onTap: () {
                    setState(() {
                      if (tab) {
                        tab = false;
                      } else {
                        tab = true;
                      }
                    });
                  },
                  child: Image.asset(
                    paths.user,
                    scale: 4,
                  )),
              tab
                  ? const Text(
                      "John dae",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  : Container(
                      width: widths * 0.5,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(3, 3),
                              blurRadius: 10,
                              spreadRadius: 10,
                              color: Color.fromRGBO(
                                  80, 85, 141, 0.14901960784313725),
                            )
                          ]),
                      child: Column(
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Upload picture",
                                style: TextStyle(fontSize: 12),
                              )),
                          const Divider(
                            height: 1,
                            endIndent: 20,
                            indent: 20,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Remove picture",
                                style: TextStyle(fontSize: 12),
                              )),
                        ],
                      ),
                    ),
              sbh(50.0),
              Container(
                padding: const EdgeInsets.all(50),
                width: widths,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: colors.textcolor),
                        "Name"),
                    const TextField(
                      cursorColor: colors.primary,
                      decoration: InputDecoration(
                        hintText: "John Dae",
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: colors.primary)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: colors.primary)),
                      ),
                    ),
                    sbh(15.0),
                    const Text(
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: colors.textcolor),
                        "Email"),
                    const TextField(
                      cursorColor: colors.primary,
                      decoration: InputDecoration(
                        hintText: "abc@gmail.com",
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: colors.primary)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: colors.primary)),
                      ),
                    ),
                    sbh(15.0),
                    const Text(
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: colors.textcolor),
                        "Your password"),
                    const TextField(
                      cursorColor: colors.primary,
                      decoration: InputDecoration(
                        hintText: "*******",
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: colors.primary)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: colors.primary)),
                      ),
                    ),
                    sbh(15.0),
                    const Text(
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: colors.textcolor),
                        "Mobile Number"),
                    const TextField(
                      cursorColor: colors.primary,
                      decoration: InputDecoration(
                        hintText: "9876543215",
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: colors.primary)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: colors.primary)),
                      ),
                    ),
                    sbh(25.0),
                    Container(
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: colors.primary),
                          borderRadius: BorderRadius.circular(25)),
                      child: TextButton(
                        onPressed: () {
                          Get.toNamed("/login");
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
  }
}
