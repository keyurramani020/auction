import 'package:btt/View/Utilites/Colors.dart';
import 'package:btt/View/Utilites/imagepath.dart';
import 'package:btt/controller/homecontroller.dart';
import 'package:btt/controller/logincontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widget/widget.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _form = GlobalKey<FormState>();

  bool eye = true;
  @override
  Widget build(BuildContext context) {
    //final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    final get = Get.put(loginController(context: context));
    final get1 = Get.put(homeController(context: context));
    return Scaffold(
      backgroundColor: colors.background,
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _form,
            child: Column(
              children: [
                Image.asset(paths.login),
                const Text(
                  "Login into your account",
                  style: TextStyle(
                      color: colors.primary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: widths,
                  height: 40,
                ),
                SizedBox(
                  width: widths * 0.8,
                  child: const Text("Email"),
                ),
                SizedBox(
                  width: widths * 0.8,
                  child: TextFormField(
                    controller: get.email,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your email";
                      } else if (!GetUtils.isEmail(value)) {
                        return "Email is Incorrect";
                      } else {
                        return null;
                      }
                    },
                    cursorColor: colors.primary,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: colors.primary)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: colors.primary)),
                        hintText: "Enter your email ID",
                        hintStyle: TextStyle(fontSize: 14)),
                  ),
                ),
                sbh(20.0),
                SizedBox(
                  width: widths * 0.8,
                  child: const Text("Password"),
                ),
                SizedBox(
                  width: widths * 0.8,
                  child: TextFormField(
                    controller: get.pass,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      }
                      return null;
                    },
                    cursorColor: colors.primary,
                    obscureText: eye,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: colors.primary)),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: colors.primary)),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                if (eye) {
                                  eye = false;
                                } else {
                                  eye = true;
                                }
                              });
                            },
                            icon: eye
                                ? Image.asset(
                                    paths.eye1,
                                    scale: 4,
                                  )
                                : Image.asset(
                                    paths.eye2,
                                    scale: 4,
                                  )),
                        hintText: "Enter password"),
                  ),
                ),
                SizedBox(
                  width: widths,
                  height: 5,
                ),
                SizedBox(
                  width: widths * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 20,
                            width: 20,
                            child: Checkbox(
                              value: get.remebermme.value,
                              onChanged: (val) {
                                setState(() {
                                  get.remebermme(val);
                                });
                              },
                              activeColor: colors.primary,
                              checkColor: colors.secondary,
                              side: const BorderSide(color: colors.primary),
                            ),
                          ),
                          const Text(" Remeber Me"),
                        ],
                      ),
                      Container(
                          alignment: Alignment.center,
                          child: const Text("Forgot password?")),
                    ],
                  ),
                ),
                SizedBox(
                  width: widths,
                  height: 30,
                ),
                Container(
                  width: widths * 0.8,
                  height: 50,
                  decoration: BoxDecoration(
                      color: colors.primary,
                      borderRadius: BorderRadius.circular(30)),
                  child: TextButton(
                    onPressed: () {
                      if (_form.currentState!.validate()) {
                        get.login();

                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   const SnackBar(content: Text('Processing Data')),
                        // );
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        get.loading.value
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : const Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                      ],
                    ),
                  ),
                ),
                Container(
                    width: widths * 0.7,
                    alignment: Alignment.center,
                    child: TextButton(
                        onPressed: () {
                          get1.Auctionlist();
                          Get.toNamed("/home");
                        },
                        child: const Text("Skip now"))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
