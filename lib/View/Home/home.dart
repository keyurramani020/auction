import 'package:btt/View/Utilites/Colors.dart';
import 'package:btt/View/Utilites/imagepath.dart';
import 'package:btt/View/Utilites/strings.dart';
import 'package:btt/controller/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/profilecontroller.dart';
import '../Widget/widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> _handleRefresh() async {
    // Fetch new data and update the state
    final get = Get.put(homeController(context: context));
    get.Auctionlist();
  }

  Future<bool?> showBackDialog() {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Are you sure?',
            style: TextStyle(color: colors.primary),
          ),
          content: const Text(
            'Are you sure you want to leave this app?',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Nevermind',
                  style: TextStyle(color: colors.primary)),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child:
                  const Text('Leave', style: TextStyle(color: colors.primary)),
              onPressed: () {
                SystemNavigator.pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    final get = Get.put(homeController(context: context));
    //final get1 = Get.put(loginController(context: context));
    final get2 = Get.put(profileController(context: context));
    return PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) async {
          if (didPop) {
            return;
          }
          final bool shouldPop = await showBackDialog() ?? false;
          if (context.mounted && shouldPop) {
            Navigator.pop(context);
          }
        },
        child: Scaffold(
          body: RefreshIndicator(
            color: colors.primary,
            onRefresh: _handleRefresh,
            child: Center(
              child: Column(
                children: [
                  sbh(50.0),
                  SizedBox(
                    width: widths * 0.9,
                    height: 50,
                    child: Row(
                      children: [
                        // Logo
                        SizedBox(
                          width: 80,
                          child: Image.asset(
                            paths.logo,
                            fit: BoxFit.cover,
                          ),
                        ),

                        // Spacer to push search bar to the right
                        const Spacer(),

                        // Search Bar Container
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: colors.serchbodercolor),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: widths * 0.5,
                          height: 40,
                          padding: const EdgeInsets.only(left: 20, right: 5),
                          child: Row(
                            children: [
                              // Search TextField
                              const Expanded(
                                child: TextField(
                                  cursorColor: colors.primary,
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Search here...",
                                    hintStyle: TextStyle(fontSize: 15),
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 12),
                                  ),
                                ),
                              ),
                              // Search Icon Button
                              Container(
                                width: 30,
                                height: 30,
                                decoration: const BoxDecoration(
                                  color: colors.primary,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.search,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Spacer to push profile icon to the right
                        const Spacer(),

                        // Profile Icon Button
                        IconButton(
                          onPressed: () async {
                            final shared =
                                await SharedPreferences.getInstance();
                            String? user = shared.getString(userid);
                            if (user != null) {
                              get2.getprofile();
                              Get.toNamed("/profile");
                            } else {
                              Get.toNamed("/authinco");
                            }
                          },
                          icon: Image.asset(
                            paths.Ellipse4,
                            scale: 4,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(() {
                    return get.loading1.value == true
                        ? SizedBox(
                            width: widths * 0.8,
                            height: heights * 0.8,
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: colors.primary,
                              ),
                            ),
                          )
                        : get.auctionlist.isEmpty
                            ? Center(
                                child: Column(
                                  children: [
                                    sbh(100.0),
                                    Image.asset(
                                      paths.oops,
                                      scale: 3,
                                    ),
                                    sbh(50.0),
                                    Container(
                                      width: widths * 0.8,
                                      height: 80,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: const Color(0xFFFFFFFF),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0xFFEEE1DD),
                                              blurRadius: 30.0,
                                              spreadRadius: 20,
                                            ),
                                          ]),
                                      child: SizedBox(
                                        width: widths * 0.6,
                                        child: const Text(
                                            textAlign: TextAlign.center,
                                            "Currently, there are no auctions available"),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : Expanded(
                                child: SizedBox(
                                  width: widths * 0.9,
                                  child: ListView.builder(
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return InkWell(
                                        onTap: () async {
                                          final shared = await SharedPreferences
                                              .getInstance();
                                          String? user =
                                              shared.getString(userid);
                                          // var clientId = shared
                                          //     .getString(clienid)
                                          //     .toString();

                                          if (user != null) {
                                            if (get.auctionlist[index]
                                                    .clickherebid ==
                                                1) {
                                              get.TermsconDitions(
                                                  get.auctionlist[index]
                                                      .auctionid
                                                      .toString(),
                                                  get.auctionlist[index]
                                                      .isitemselection
                                                      .toString());
                                            } else {
                                              get.AuctionDetail(
                                                  get.auctionlist[index]
                                                      .auctionid
                                                      .toString(),
                                                  "1");

                                              Get.toNamed("/details");
                                            }
                                          } else {
                                            Get.toNamed("/authinco");
                                          }
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              width: widths * 0.9,
                                              decoration: BoxDecoration(
                                                  // color: colors.primary2,
                                                  border: Border.all(
                                                      color: colors.primary),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              padding: const EdgeInsets.all(10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        height: 25,
                                                        width: 25,
                                                        decoration:
                                                            const BoxDecoration(
                                                                color: colors
                                                                    .primary,
                                                                shape: BoxShape
                                                                    .circle),
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          (index + 1)
                                                              .toString(),
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                      ),
                                                      sbw(10.0),
                                                      SizedBox(
                                                          width: widths * 0.7,
                                                          child: Text(
                                                            get
                                                                .auctionlist[
                                                                    index]
                                                                .auctionbrief
                                                                .toString(),
                                                            style: const TextStyle(
                                                                color: colors
                                                                    .primary,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                    ],
                                                  ),
                                                  sbh(10.0),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      sbw(20.0),
                                                      SizedBox(
                                                          width: widths * 0.25,
                                                          child: const Text(
                                                            "Auction ID",
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                color: colors
                                                                    .textcolor),
                                                          )),
                                                      const Text(":     "),
                                                      Text(
                                                        get.auctionlist[index]
                                                            .auctionid
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontSize: 13,
                                                            color: colors
                                                                .textcolor),
                                                      ),
                                                    ],
                                                  ),
                                                  sbh(2.0),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      sbw(20.0),
                                                      SizedBox(
                                                          width: widths * 0.25,
                                                          child: const Text(
                                                            "Department name",
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                color: colors
                                                                    .textcolor),
                                                          )),
                                                      const Text(":     "),
                                                      Text(
                                                        get.auctionlist[index]
                                                            .deptname
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontSize: 13,
                                                            color: colors
                                                                .textcolor),
                                                      ),
                                                    ],
                                                  ),
                                                  sbh(5.0),
                                                  Row(
                                                    children: [
                                                      sbw(20.0),
                                                      SizedBox(
                                                          width: widths * 0.25,
                                                          child: const Text(
                                                            "Event Type",
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                color: colors
                                                                    .textcolor),
                                                          )),
                                                      const Text(":     "),
                                                      Text(
                                                        get.auctionlist[index]
                                                            .typeofauction
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontSize: 13,
                                                            color: colors
                                                                .textcolor),
                                                      ),
                                                    ],
                                                  ),
                                                  sbh(5.0),
                                                  Row(
                                                    children: [
                                                      sbw(20.0),
                                                      SizedBox(
                                                          width: widths * 0.25,
                                                          child: const Text(
                                                            "Start Date",
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                color: colors
                                                                    .textcolor),
                                                          )),
                                                      const Text(":     "),
                                                      Text(
                                                        get.auctionlist[index]
                                                            .startdate
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontSize: 13,
                                                            color: colors
                                                                .textcolor),
                                                      ),
                                                    ],
                                                  ),
                                                  sbh(5.0),
                                                  Row(
                                                    children: [
                                                      sbw(20.0),
                                                      SizedBox(
                                                          width: widths * 0.25,
                                                          child: const Text(
                                                            "End Date",
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                color: colors
                                                                    .textcolor),
                                                          )),
                                                      const Text(":     "),
                                                      Text(
                                                        get.auctionlist[index]
                                                            .enddatevirtual
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontSize: 13,
                                                            color: colors
                                                                .textcolor),
                                                      ),
                                                    ],
                                                  ),
                                                  sbh(15.0),
                                                  SizedBox(
                                                    width: widths * 0.8,
                                                    height: 30,
                                                    child: Row(
                                                      children: [
                                                        TextButton(
                                                          onPressed: () async {
                                                            await get.getupdo(get
                                                                .Response2
                                                                .value
                                                                .responseData!
                                                                .responseMap!
                                                                .mapList![index]
                                                                .auctionid
                                                                .toString());
                                                            get.downloads(get
                                                                .Response2
                                                                .value
                                                                .responseData!
                                                                .responseMap!
                                                                .mapList![index]
                                                                .auctionid
                                                                .toString());
                                                          },
                                                          child: Image.asset(
                                                            paths.document,
                                                            scale: 4,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        sbw(20.0),
                                                        SizedBox(
                                                          width: 50,
                                                          child: Image.asset(
                                                            paths.result,
                                                            scale: 4,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        const Expanded(
                                                            child: Text("")),
                                                        Container(
                                                          height: 25,
                                                          width: 70,
                                                          alignment:
                                                              Alignment.center,
                                                          decoration: BoxDecoration(
                                                              color: colors
                                                                  .primary,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                          child: Text(
                                                            get.auth.value ==
                                                                    true
                                                                ? (get.auctionlist[index]
                                                                            .clickherebid ==
                                                                        1
                                                                    ? "Details"
                                                                    : "Bid Now")
                                                                : "Details",
                                                            style:
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  sbh(10.0),
                                                ],
                                              ),
                                            ),
                                            sbh(10.0),
                                          ],
                                        ),
                                      );
                                    },
                                    itemCount: get.auctionlist.length,
                                  ),
                                ),
                              );
                  }),
                ],
              ),
            ),
          ),
        ));
  }
}
