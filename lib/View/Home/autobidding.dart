import 'package:btt/View/Utilites/Colors.dart';
import 'package:btt/View/Utilites/imagepath.dart';
import 'package:btt/controller/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/profilecontroller.dart';

class autobidding extends StatefulWidget {
  const autobidding({super.key});

  @override
  State<autobidding> createState() => _autobiddingState();
}

class _autobiddingState extends State<autobidding> {
  bool _loading = false;
  Future<void> _onTap() async {
    setState(() {
      _loading = true;
    });

    try {
      Get.toNamed("/yourrank");
    } catch (e) {
      // Handle error
      //print(e);
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    final get = Get.put(homeController(context: context));
    get.value.clear();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    final get = Get.put(homeController(context: context));
    final get1 = Get.put(profileController(context: context));
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) {
          return;
        }
        Get.toNamed("/itemselection");
        // final bool shouldPop = await _showBackDialog() ?? false;
        // if (context.mounted && shouldPop) {
        //   Navigator.pop(context);
        // }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: widths * 0.9,
                height: 50,
                child: Row(
                  children: [
                    SizedBox(
                      width: widths * 0.9,
                      height: 50,
                      child: Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                Get.toNamed("/home");
                              },
                              child: Image.asset(
                                paths.logo,
                                scale: 4,
                              )),
                          SizedBox(
                            width: widths * 0.5,
                          ),
                          IconButton(
                            onPressed: () {
                              get1.getprofile();
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
                  ],
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                width: widths * 0.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(3, 3),
                        blurRadius: 30,
                        spreadRadius: 30,
                        color: Color.fromRGBO(80, 85, 141, 0.14901960784313725),
                      )
                    ]),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Auto Bidding",
                        style: TextStyle(
                            color: colors.primary,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: widths * 0.6,
                        child: Text(
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 16),
                            "Set your ${get.Response3.value.responseData?.eventTypeId == 1 ? "Higest" : "Lowest"}Bid Limit"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: widths * 0.65,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: colors.primary)),
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some value';
                            }
                            return null;
                          },
                          controller: get.value,
                          cursorColor: colors.primary,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Ex. 21000",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: widths * 0.78,
                        child: Container(
                          width: widths * 0.25,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25)),
                          child: TextButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _onTap();
                              }
                            },
                            child: _loading
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: colors.primary,
                                    ),
                                  )
                                : const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Start Auto Bidding",
                                        style: TextStyle(color: colors.primary),
                                      ),
                                      Icon(Icons.arrow_right_alt,
                                          color: colors.primary)
                                    ],
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
