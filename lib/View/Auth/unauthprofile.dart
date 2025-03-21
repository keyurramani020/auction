import 'package:btt/View/Utilites/Colors.dart';
import 'package:btt/View/Utilites/imagepath.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widget/widget.dart';

class UnauthProfile extends StatefulWidget {
  const UnauthProfile({super.key});

  @override
  State<UnauthProfile> createState() => _UnauthProfileState();
}

class _UnauthProfileState extends State<UnauthProfile> {
  @override
  Widget build(BuildContext context) {
    //final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                  width: widths,
                  height: 120,
                  child: Image.asset(
                    paths.top,
                    fit: BoxFit.fill,
                  )),
              SizedBox(
                height: 150,
                width: 150,
                child: Image.asset(
                  paths.user,
                  fit: BoxFit.fill,
                ),
              ),
              const Text("john dae"),
              sbh(50.0),
              Container(
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
                  children: [
                    Container(
                      width: widths,
                      height: 120,
                      decoration: const BoxDecoration(
                          color: colors.primary2,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: widths * 0.6,
                            child: const Text(
                                textAlign: TextAlign.center,
                                "Authentication is incomplete,Kindly complete your authentication"),
                          ),
                          sbh(10.0),
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                                color: colors.primary,
                                borderRadius: BorderRadius.circular(20)),
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Authentication",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    sbh(10.0),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
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
                            children: [
                              const Text(
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16),
                                  "abc@gmail.com"),
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
                              "Email"),
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
                              const Text(
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16),
                                  "90837847682"),
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
                              onPressed: () {
                                Get.toNamed("/login");
                              },
                              child: const Text(
                                "Log Out",
                                style: TextStyle(color: colors.primary),
                              ),
                            ),
                          ),
                          sbh(30.0),
                        ],
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
