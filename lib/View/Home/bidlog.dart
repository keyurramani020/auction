import 'package:btt/View/Utilites/Colors.dart';
import 'package:btt/controller/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widget/widget.dart';

const List<String> list = <String>['All', 'Accepted', 'Rejected'];

class BidLogpage extends StatefulWidget {
  const BidLogpage({super.key});

  @override
  State<BidLogpage> createState() => _BidLogpageState();
}

class _BidLogpageState extends State<BidLogpage> {
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    final get = Get.put(homeController(context: context));

    return Scaffold(
        body: Center(
      child: Column(children: [
        sbh(40.0),
        // Container(
        //   width: widths * 0.9,
        //   height: 50,
        //   child: Row(
        //     children: [
        //       TextButton(
        //           onPressed: () {
        //             Get.toNamed("/home");
        //           },
        //           child: Image.asset(
        //             paths.logo,
        //             scale: 4,
        //           )),
        //       SizedBox(
        //         width: widths * 0.5,
        //       ),
        //       IconButton(
        //         onPressed: () {
        //           final get = Get.put(profileController(context: context));
        //           get.getprofile();
        //           Get.toNamed("/profile");
        //         },
        //         icon: Image.asset(
        //           paths.Ellipse4,
        //           scale: 4,
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        Container(
          width: widths,
          height: heights * 0.06,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              color: colors.primary2,
              border: Border.symmetric(
                  horizontal: BorderSide(color: colors.primary))),
          child: const Text(
            "Bidding Hall",
            style:
                TextStyle(color: colors.primary, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: widths * 0.8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: widths * 0.3,
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30)),
                alignment: Alignment.center,
                child: DropdownButton<String>(
                  underline: Container(
                    color: Colors.white,
                  ),
                  value: dropdownValue,
                  icon: const Icon(Icons.keyboard_arrow_down_sharp),
                  elevation: 12,
                  style: const TextStyle(color: colors.primary),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
                      get.Bidlog(dropdownValue == "All"
                          ? "0"
                          : (dropdownValue == "Accepted" ? "1" : "2"));
                    });
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              TextButton(
                child: const Text(
                  "<< Back",
                  style: TextStyle(color: colors.primary),
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ],
          ),
        ),
        // Container(
        //   width: widths * 0.85,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Container(
        //         width: widths * 0.3,
        //         height: 40,
        //         decoration: BoxDecoration(
        //             border: Border.all(color: Colors.grey),
        //             borderRadius: BorderRadius.circular(30)),
        //         alignment: Alignment.center,
        //         child: DropdownButton<String>(
        //           underline: Container(
        //             color: Colors.white,
        //           ),
        //           value: dropdownValue,
        //           icon: const Icon(Icons.keyboard_arrow_down_sharp),
        //           elevation: 12,
        //           style: const TextStyle(color: colors.primary),
        //           onChanged: (String? value) {
        //             // This is called when the user selects an item.
        //             setState(() {
        //               dropdownValue = value!;
        //               get.Bidlog(dropdownValue == "All"
        //                   ? "0"
        //                   : (dropdownValue == "Accepted" ? "1" : "2"));
        //             });
        //           },
        //           items: list.map<DropdownMenuItem<String>>((String value) {
        //             return DropdownMenuItem<String>(
        //               value: value,
        //               child: Text(value),
        //             );
        //           }).toList(),
        //         ),
        //       ),
        //       // Container(
        //       //   width: widths * 0.5,
        //       //   height: 40,
        //       //   padding: EdgeInsets.only(left: 10),
        //       //   decoration: BoxDecoration(
        //       //       border: Border.all(color: Colors.grey),
        //       //       borderRadius: BorderRadius.circular(20)),
        //       //   alignment: Alignment.center,
        //       //   child: Row(
        //       //     children: [
        //       //       TextField(
        //       //         cursorColor: colors.primary,
        //       //         decoration: InputDecoration(
        //       //           contentPadding: const EdgeInsets.all(4),
        //       //           hintText: "Search here...",
        //       //           border: InputBorder.none,
        //       //         ),
        //       //       ),
        //       //       Container(
        //       //         margin: EdgeInsets.all(3),
        //       //         decoration: BoxDecoration(
        //       //             shape: BoxShape.circle, color: colors.primary),
        //       //         child: Icon(
        //       //           Icons.search_rounded,
        //       //           color: Colors.white,
        //       //         ),
        //       //       )
        //       //     ],
        //       //   ),
        //       // )
        //     ],
        //   ),
        // ),
        Obx(() {
          return get.loading10.value == true
              ? SizedBox(
                  width: widths * 0.8,
                  height: heights * 0.8,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: colors.primary,
                    ),
                  ),
                )
              : Expanded(
                  child: SizedBox(
                    width: widths * 0.85,
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: colors.primary)),
                              child: Column(
                                children: [
                                  sbh(10.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: widths * 0.08,
                                      ),
                                      Container(
                                        width: widths * 0.3,
                                        alignment: Alignment.centerLeft,
                                        child: const Text(
                                          "Item Sr no.",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const Text(
                                        ":     ",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: widths * 0.4,
                                        child: Text(
                                          get.Response10.value.responseData!
                                              .bidHisList[index].rowid
                                              .toString(),
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  sbh(5.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: widths * 0.08,
                                      ),
                                      Container(
                                        width: widths * 0.3,
                                        alignment: Alignment.centerLeft,
                                        child: const Text(
                                          "Item name",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const Text(
                                        ":     ",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: widths * 0.4,
                                        child: Text(
                                          get.Response10.value.responseData!
                                              .bidHisList[index].itemname
                                              .toString(),
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  sbh(5.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: widths * 0.08,
                                      ),
                                      Container(
                                        width: widths * 0.3,
                                        alignment: Alignment.centerLeft,
                                        child: const Text(
                                          "Item name",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const Text(
                                        ":     ",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: widths * 0.4,
                                        child: Text(
                                          get.Response10.value.responseData!
                                              .bidHisList[index].ipaddress
                                              .toString(),
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  sbh(5.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: widths * 0.08,
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        width: widths * 0.3,
                                        child: const Text(
                                          "Date and time",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const Text(
                                        ":     ",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: widths * 0.4,
                                        child: Text(
                                          get.Response10.value.responseData!
                                              .bidHisList[index].bidtime
                                              .toString(),
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: widths * 0.08,
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        width: widths * 0.3,
                                        child: const Text(
                                          "Amount",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const Text(
                                        ":     ",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: widths * 0.4,
                                        child: Text(
                                          get.Response10.value.responseData!
                                              .bidHisList[index].bidderbidprice
                                              .toString(),
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: widths * 0.08,
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        width: widths * 0.3,
                                        child: const Text(
                                          "Status",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const Text(
                                        ":     ",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: widths * 0.4,
                                        child: Text(
                                          get
                                                      .Response10
                                                      .value
                                                      .responseData!
                                                      .bidHisList[index]
                                                      .rejectstatus ==
                                                  0
                                              ? "Accepted"
                                              : "Rejected",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: get
                                                          .Response10
                                                          .value
                                                          .responseData!
                                                          .bidHisList[index]
                                                          .rejectstatus ==
                                                      0
                                                  ? Colors.green
                                                  : Colors.red),
                                        ),
                                      )
                                    ],
                                  ),
                                  sbh(5.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: widths * 0.08,
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        width: widths * 0.3,
                                        child: const Text(
                                          "Remarks",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const Text(
                                        ":     ",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: widths * 0.4,
                                        child: Text(
                                          get.Response10.value.responseData!
                                              .bidHisList[index].remark
                                              .toString(),
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        );
                      },
                      itemCount:
                          get.Response10.value.responseData!.bidHisList.length,
                    ),
                  ),
                );
        })
      ]),
    ));
  }
}
