import 'dart:async';

import 'package:btt/View/Utilites/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controller/homecontroller.dart';
import '../../controller/timercontroller.dart';
import '../Widget/widget.dart';

class autobidpage extends StatefulWidget {
  const autobidpage({super.key});

  @override
  State<autobidpage> createState() => _autobidpageState();
}

class _autobidpageState extends State<autobidpage> {
  String TotalRate = "";
  String Nextpossible = "";
  int itemnameindex = -1;
  int qunindex = -1;
  int yourrankindex = -1;
  int nextpossindex = -1;
  int lastbidindex = -1;
  int startindex = -1;
  int incrementindex = -1;
  int h1bidindex = -1;
  int totalrateindex = -1;
  final _formKey = GlobalKey<FormState>();
  String indexf() {
    final get = Get.put(homeController(context: context));
    final detail = get.Response11.value.responseData!.biddingHallDetail![0];
    final cellValueList = detail.auctionCellValueList!;
    itemnameindex = get.Response11.value.responseData!.auctionColumnHeader!
        .indexWhere((element) => element.columntypeid == 1);
    qunindex = get.Response11.value.responseData!.auctionColumnHeader!
        .indexWhere((element) => element.columntypeid == 2);
    yourrankindex = get.Response11.value.responseData!.auctionColumnHeader!
        .indexWhere((element) => element.columntypeid == 10005);
    nextpossindex = get.Response11.value.responseData!.auctionColumnHeader!
        .indexWhere((element) => element.columntypeid == 10003);
    lastbidindex = get.Response11.value.responseData!.auctionColumnHeader!
        .indexWhere((element) => element.columntypeid == 10004);
    startindex = get.Response11.value.responseData!.auctionColumnHeader!
        .indexWhere((element) => element.columntypeid == 10001);
    incrementindex = get.Response11.value.responseData!.auctionColumnHeader!
        .indexWhere((element) => element.columntypeid == 10007);
    h1bidindex = get.Response11.value.responseData!.auctionColumnHeader!
        .indexWhere((element) => element.columntypeid == 10002);
    totalrateindex = get.Response11.value.responseData!.auctionColumnHeader!
        .indexWhere((element) => element.columntypeid == 5);
    return "null";
  }

  // String NextpossibleValue() {
  //   final get = Get.put(homeController(context: context));
  //   final detail = get.Response11.value.responseData!.biddingHallDetail![0];
  //   final cellValueList = detail.auctionCellValueList!;
  //   double cellValue1 =
  //       double.parse(cellValueList[qunindex].cellvalue.toString());
  //   double next = double.parse(cellValueList[startindex].cellvalue.toString());
  //   double cellValue5 =
  //       double.parse(cellValueList[h1bidindex].cellvalue.toString()); //h1
  //   double cellValue2 = double.parse(
  //       cellValueList[lastbidindex].cellvalue.toString()); //last bid
  //   double cellValue7 =
  //       double.parse(cellValueList[incrementindex].cellvalue.toString()); //inc
  //   double cellValue3 =
  //       double.parse(cellValueList[startindex].cellvalue.toString()); //start
  //   double filledby =
  //       double.parse(cellValueList[startindex].cellvalue.toString());
  //
  //   if (cellValue5 > 0.00) {
  //     Nextpossible = (cellValue5 + cellValue7).toString();
  //     TotalRate = ((cellValue5 + cellValue7) * cellValue1).toString();
  //
  //     return (cellValue5 + cellValue7).toString();
  //   } else {
  //     if (detail.firstbidcond.toString() == "1") {
  //       Nextpossible = cellValue3.toString();
  //       TotalRate = (cellValue3 * cellValue1).toString();
  //
  //       return cellValue3.toString();
  //     } else {
  //       Nextpossible = (cellValue3 + cellValue7).toString();
  //       TotalRate = ((cellValue3 + cellValue7) * cellValue1).toString();
  //
  //       return (cellValue3 + cellValue7).toString();
  //     }
  //   }
  // }
  //
  // String Nextpossibledecrement() {
  //   final get = Get.put(homeController(context: context));
  //   final detail = get.Response11.value.responseData!.biddingHallDetail![0];
  //   final cellValueList = detail.auctionCellValueList!;
  //   double cellValue1 =
  //       double.parse(cellValueList[qunindex].cellvalue.toString());
  //   double next = double.parse(cellValueList[startindex].cellvalue.toString());
  //   double cellValue5 =
  //       double.parse(cellValueList[h1bidindex].cellvalue.toString()); //h1
  //   double cellValue2 = double.parse(
  //       cellValueList[lastbidindex].cellvalue.toString()); //last bid
  //   double cellValue7 =
  //       double.parse(cellValueList[incrementindex].cellvalue.toString()); //inc
  //   double cellValue3 =
  //       double.parse(cellValueList[startindex].cellvalue.toString()); //start
  //   double filledby =
  //       double.parse(cellValueList[startindex].cellvalue.toString());
  //
  //   if (cellValue5 > 0.00) {
  //     Nextpossible = (cellValue5 - cellValue7).toString();
  //     TotalRate = ((cellValue5 - cellValue7) * cellValue1).toString();
  //
  //     return Nextpossible;
  //   } else {
  //     if (detail.firstbidcond.toString() == "1") {
  //       Nextpossible = cellValue3.toString();
  //       TotalRate = (cellValue3 * cellValue1).toString();
  //
  //       return Nextpossible;
  //     } else {
  //       Nextpossible = (cellValue3 - cellValue7).toString();
  //       TotalRate = ((cellValue3 - cellValue7) * cellValue1).toString();
  //
  //       return Nextpossible;
  //     }
  //   }
  // }
  //
  // String TotalRateValue(a) {
  //   double next = double.parse(Nextpossible.toString());
  //
  //   double con = double.parse(a);
  //   TotalRate = (next * con).toString();
  //   return (next * con).toString();
  // }

  String Remaining(String enddate) {
    String endDateStr = enddate;
    DateTime endDate = DateFormat("dd/MM/yyyy HH:mm:ss").parse(endDateStr);

    // Get the current date (without time)
    DateTime currentDate = DateTime.now();
    currentDate =
        DateTime(currentDate.year, currentDate.month, currentDate.day);

    // Calculate the difference in days
    Duration difference = endDate.difference(currentDate);
    int remainingDays = difference.inDays;
    return remainingDays.toString();
  }

  @override
  void initState() {
    // TODO: implement initState
    final get = Get.put(homeController(context: context));
    final get1 = Get.put(TimerController(context: context));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      get.showMyDialog();
    });
    indexf();
    super.initState();
  }

  @override
  void dispose() {
    final get = Get.put(homeController(context: context));
    get.value.clear();
    get.autobiddingstates.value = false;
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    final get = Get.put(homeController(context: context));

    final get1 = Get.put(TimerController(context: context));
    final detail = get.Response11.value.responseData!.biddingHallDetail![0];
    final cellValueList = detail.auctionCellValueList!;
    // double cellValue1 =
    //     double.parse(cellValueList[qunindex].cellvalue.toString());
    //
    // double cellValue5 =
    //     double.parse(cellValueList[h1bidindex].cellvalue.toString()); //h1
    //
    // double cellValue7 =
    //     double.parse(cellValueList[incrementindex].cellvalue.toString()); //inc
    // double cellValue3 =
    //     double.parse(cellValueList[startindex].cellvalue.toString()); //start

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
              'Are you sure you want to off auto bid ?',
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('cancel',
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
                    const Text('Off', style: TextStyle(color: colors.primary)),
                onPressed: () {
                  get.value.clear();
                  get.autobiddingstates.value = false;
                  Get.toNamed("/itemselection");
                  // Navigator.pop(context, true);
                  // get.GetitemSelection(
                  //     get.Response3.value.responseData!.auctionId.toString());
                  //Get.toNamed("/itemselection");
                },
              ),
            ],
          );
        },
      );
    }

    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) {
          return;
        }
        await showBackDialog();
        // if (didPop) {
        //   get.GetitemSelection(
        //       get.Response3.value.responseData!.auctionId.toString());
        //   Get.toNamed("/itemselection");
        // }
        // final bool shouldPop = get.autobiddingstates.value
        //     ? await showBackDialog() ?? false
        //     : false;
        // if (context.mounted && shouldPop) {
        //   get.GetitemSelection(
        //       get.Response3.value.responseData!.auctionId.toString());
        //   Get.toNamed("/itemselection");
        // } else {}
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                sbh(50.0),
                SizedBox(
                  width: widths * 0.9,
                  height: 50,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () async {
                            await showBackDialog();
                          },
                          icon: const Icon(Icons.arrow_back_ios_sharp)),
                      Expanded(child: Text("")),
                      TextButton(
                        onPressed: () {
                          get.Bidlog("0");
                          Get.toNamed("/BidLogpage");
                        },
                        child: const Row(children: [
                          Text(
                            "Bid Log",
                            style: TextStyle(color: colors.primary),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: colors.primary,
                          )
                        ]),
                      )
                    ],
                  ),
                ),
                sbh(10.0),
                Obx(() {
                  return Column(
                    children: [
                      Container(
                        width: widths * 0.8,
                        decoration: BoxDecoration(
                            color: colors.primary2,
                            border: Border.all(color: colors.primary),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            sbh(20.0),
                            SizedBox(
                              width: widths * 0.75,
                              child: Text(
                                textAlign: TextAlign.center,
                                "Auction Name : ${get.Response3.value.responseData!.auctionBrief}",
                                style: const TextStyle(
                                    color: colors.primary,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: widths * 0.75,
                              child: Text(
                                textAlign: TextAlign.center,
                                "Department Name : ${get.Response3.value.responseData!.departmentName}",
                                style: const TextStyle(
                                    color: colors.primary,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            sbh(20.0),
                          ],
                        ),
                      ),
                      sbh(20.0),
                      SizedBox(
                        width: widths * 0.8,
                        child: Row(
                          children: [
                            SizedBox(
                              width: widths * 0.5,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 70,
                                        child: Text(
                                          "Start Date",
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ),
                                      const Text(
                                        ":  ",
                                        style: TextStyle(fontSize: 10),
                                      ),
                                      Text(
                                        get.Response11.value.responseData!
                                            .biddingHallDetail![0].startdate
                                            .toString(),
                                        style: const TextStyle(fontSize: 10),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 70,
                                        child: Text(
                                          "Current Date",
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ),
                                      const Text(
                                        ":  ",
                                        style: TextStyle(fontSize: 10),
                                      ),
                                      Text(
                                        get.Response11.value.responseData!
                                            .biddingHallDetail![0].enddate
                                            .toString(),
                                        style: const TextStyle(fontSize: 10),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const Expanded(child: Text("")),
                            Container(
                              width: widths * 0.25,
                              height: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: colors.primary,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                "${Remaining(get.Response11.value.responseData!.biddingHallDetail![0].enddatevirtual.toString())} Days left",
                                style: const TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: widths * 0.8,
                        margin: const EdgeInsets.all(16),
                        child: Table(
                          border: const TableBorder(
                            horizontalInside:
                                BorderSide(color: Colors.grey, width: 1),
                            verticalInside:
                                BorderSide(color: Colors.grey, width: 1),
                          ),
                          children: [
                            TableRow(
                              children: [
                                Column(
                                  children: [
                                    sbh(10.0),
                                    const Text(
                                      "Item name",
                                      style: TextStyle(
                                          color: colors.primary,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    sbh(5.0),
                                    Text(get
                                        .Response11
                                        .value
                                        .responseData!
                                        .biddingHallDetail![0]
                                        .auctionCellValueList![itemnameindex]
                                        .cellvalue
                                        .toString()),
                                    sbh(10.0),
                                  ],
                                ),
                                Column(
                                  children: [
                                    sbh(10.0),
                                    const Text(
                                      "Your Rank",
                                      style: TextStyle(
                                          color: colors.primary,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    sbh(5.0),
                                    Text(get
                                        .Response11
                                        .value
                                        .responseData!
                                        .biddingHallDetail![0]
                                        .auctionCellValueList![yourrankindex]
                                        .cellvalue
                                        .toString()),
                                    sbh(10.0),
                                  ],
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Column(
                                  children: [
                                    sbh(15.0),
                                    const Text(
                                      "Your limit value",
                                      style: TextStyle(
                                          color: colors.primary,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    sbh(5.0),
                                    Text(get.value.text),
                                    sbh(10.0),
                                  ],
                                ),
                                Column(
                                  children: [
                                    sbh(10.0),
                                    const Text(
                                      "H1 Bid",
                                      style: TextStyle(
                                          color: colors.primary,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    sbh(5.0),
                                    Text(get
                                        .Response11
                                        .value
                                        .responseData!
                                        .biddingHallDetail![0]
                                        .auctionCellValueList![h1bidindex]
                                        .cellvalue
                                        .toString()),
                                    sbh(10.0)
                                  ],
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const Text(
                                      "Last bid price",
                                      style: TextStyle(
                                          color: colors.primary,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(get
                                        .Response11
                                        .value
                                        .responseData!
                                        .biddingHallDetail![0]
                                        .auctionCellValueList![lastbidindex]
                                        .cellvalue
                                        .toString()),
                                    const SizedBox(
                                      height: 10,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      get
                                                  .Response11
                                                  .value
                                                  .responseData!
                                                  .biddingHallDetail![0]
                                                  .eventtypeid
                                                  .toString() ==
                                              "1"
                                          ? "Increment"
                                          : "Decrement",
                                      style: const TextStyle(
                                          color: colors.primary,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(get
                                        .Response11
                                        .value
                                        .responseData!
                                        .biddingHallDetail![0]
                                        .auctionCellValueList![incrementindex]
                                        .cellvalue
                                        .toString()),
                                    // SizedBox(
                                    //   height: 10,
                                    // )
                                  ],
                                ),
                              ],
                            ),
                            // TableRow(
                            //   children: [
                            //     Container(
                            //       child: Column(
                            //         children: [
                            //           SizedBox(
                            //             height: 15,
                            //           ),
                            //           Text(
                            //             "Next possible bid",
                            //             style: TextStyle(
                            //                 color: colors.primary,
                            //                 fontWeight: FontWeight.bold),
                            //           ),
                            //           SizedBox(
                            //             height: 5,
                            //           ),
                            //           Text(get
                            //                       .Response11
                            //                       .value
                            //                       .responseData!
                            //                       .auctionColumnHeader![
                            //                           nextpossindex]
                            //                       .filledby
                            //                       .toString() ==
                            //                   "1"
                            //               ? get
                            //                   .Response11
                            //                   .value
                            //                   .responseData!
                            //                   .biddingHallDetail![0]
                            //                   .auctionCellValueList![
                            //                       nextpossindex]
                            //                   .cellvalue
                            //                   .toString()
                            //               : get
                            //                           .Response11
                            //                           .value
                            //                           .responseData!
                            //                           .biddingHallDetail![0]
                            //                           .eventtypeid
                            //                           .toString() ==
                            //                       "1"
                            //                   ? cellValue5 > 0.00
                            //                       ? (cellValue5 + cellValue7)
                            //                           .toString()
                            //                       : detail.firstbidcond
                            //                                   .toString() ==
                            //                               "1"
                            //                           ? cellValue3.toString()
                            //                           : (cellValue3 + cellValue7)
                            //                               .toString()
                            //                   : cellValue5 > 0.00
                            //                       ? (cellValue5 - cellValue7)
                            //                           .toString()
                            //                       : detail.firstbidcond
                            //                                   .toString() ==
                            //                               "1"
                            //                           ? cellValue3.toString()
                            //                           : (cellValue3 - cellValue7)
                            //                               .toString()),
                            //           SizedBox(
                            //             height: 10,
                            //           )
                            //         ],
                            //       ),
                            //     ),
                            //     Container(
                            //       child: Column(
                            //         children: [
                            //           SizedBox(
                            //             height: 15,
                            //           ),
                            //           Text(
                            //             "Total Rate",
                            //             style: TextStyle(
                            //                 color: colors.primary,
                            //                 fontWeight: FontWeight.bold),
                            //           ),
                            //           SizedBox(
                            //             height: 5,
                            //           ),
                            //           Text(
                            //             get
                            //                         .Response11
                            //                         .value
                            //                         .responseData!
                            //                         .auctionColumnHeader![
                            //                             nextpossindex]
                            //                         .filledby
                            //                         .toString() ==
                            //                     "1"
                            //                 ? get
                            //                     .Response11
                            //                     .value
                            //                     .responseData!
                            //                     .biddingHallDetail![0]
                            //                     .auctionCellValueList![
                            //                         nextpossindex]
                            //                     .cellvalue
                            //                     .toString()
                            //                 : get
                            //                             .Response11
                            //                             .value
                            //                             .responseData!
                            //                             .biddingHallDetail![0]
                            //                             .eventtypeid
                            //                             .toString() ==
                            //                         "1"
                            //                     ? cellValue5 > 0.00
                            //                         ? ((cellValue5 + cellValue7) * cellValue1)
                            //                             .toString()
                            //                         : detail.firstbidcond.toString() ==
                            //                                 "1"
                            //                             ? (cellValue3 * cellValue1)
                            //                                 .toString()
                            //                             : ((cellValue3 + cellValue7) * cellValue1)
                            //                                 .toString()
                            //                     : cellValue5 > 0.00
                            //                         ? ((cellValue5 - cellValue7) *
                            //                                 cellValue1)
                            //                             .toString()
                            //                         : detail.firstbidcond.toString() ==
                            //                                 "1"
                            //                             ? (cellValue3 * cellValue1)
                            //                                 .toString()
                            //                             : ((cellValue3 - cellValue7) *
                            //                                     cellValue1)
                            //                                 .toString(),
                            //           ),
                            //           SizedBox(
                            //             height: 10,
                            //           )
                            //         ],
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: widths,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Auto Bidding States",
                                  style: TextStyle(
                                      color: colors.primary,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("OFF   "),
                                    Switch(
                                      // This bool value toggles the switch.
                                      value: get.autobiddingstates.value,
                                      activeColor: colors.primary,
                                      onChanged: (bool value) {
                                        setState(() {
                                          get.autobiddingstates.value = value;
                                          if (value == true) {
                                            get1.performTask();
                                          }
                                          if (get.autobiddingstates.value ==
                                              false) {
                                            get1.countdownTimer?.cancel();
                                          }
                                        });
                                        if (get.autobiddingstates.value ==
                                            false) {
                                          get1.countdownTimer?.cancel();
                                        }
                                      },
                                    ),
                                    const Text("   ON"),
                                  ],
                                ),
                                sbh(10.0),
                              ],
                            ),
                            sbw(30.0),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Voice States",
                                  style: TextStyle(
                                      color: colors.primary,
                                      fontWeight: FontWeight.bold),
                                ),
                                sbh(5.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("OFF   "),
                                    Switch(
                                      // This bool value toggles the switch.
                                      value: get.voicestates.value,
                                      activeColor: colors.primary,
                                      onChanged: (bool value) {
                                        setState(() {
                                          get.voicestates.value = value;
                                        });
                                      },
                                    ),
                                    const Text("   ON"),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      sbh(10.0),
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
                                color: Color.fromRGBO(
                                    80, 85, 141, 0.14901960784313725),
                              )
                            ]),
                        child: Column(
                          children: [
                            const Text(
                              "Your Next Bid in",
                              style: TextStyle(
                                  color: colors.primary,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: widths * 0.7,
                              child: Text(
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  "${get1.remainingSeconds.value.toString()} seconds..."),
                            ),
                            // Lottie.asset(
                            //   paths.gif1,
                            // ),
                            // Container(
                            //   width: widths * 0.7,
                            //   child: Text(
                            //       textAlign: TextAlign.center,
                            //       style: TextStyle(fontSize: 12),
                            //       "From your bidding value, your current rank is lower than "
                            //       "desired. To improve your visibility and increase your chances "
                            //       "of success, we are increasing your bidding value"),
                            // ),
                          ],
                        ),
                      ),
                      sbh(30.0),
                      // Container(
                      //   width: widths * 0.8,
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Text(
                      //         "Your limit value : ",
                      //         style: TextStyle(
                      //             color: colors.primary,
                      //             fontSize: 16,
                      //             fontWeight: FontWeight.bold),
                      //       ),
                      //       Text(get.value.text)
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Container(
                        width: widths * 0.4,
                        decoration: BoxDecoration(
                            border: Border.all(color: colors.primary),
                            borderRadius: BorderRadius.circular(25)),
                        child: TextButton(
                            onPressed: () {
                              get.showMyDialog();
                              get.autobiddingstates.value = false;
                            },
                            child: const Text(
                              textAlign: TextAlign.center,
                              "Change Auto value",
                              style: TextStyle(color: colors.primary),
                            )),
                      ),
                      sbh(20.0),
                    ],
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//
// class ListItem extends StatefulWidget {
//   final int index;
//
//   ListItem({required this.index});
//
//   @override
//   _ListItemState createState() => _ListItemState();
// }
//
// class _ListItemState extends State<ListItem> {
//   bool _isSelected = false;
//   String TotalRate = "";
//   String Nextpossible = "";
//   int itemnameindex = -1;
//   int qunindex = -1;
//   int yourrankindex = -1;
//   int nextpossindex = -1;
//   int lastbidindex = -1;
//   int startindex = -1;
//   int incrementindex = -1;
//   int h1bidindex = -1;
//   int totalrateindex = -1;
//
//   String indexf() {
//     final get = Get.put(homeController(context: context));
//     final detail = get.Response11.value.responseData!.biddingHallDetail![0];
//     final cellValueList = detail.auctionCellValueList!;
//     itemnameindex = get.Response11.value.responseData!.auctionColumnHeader!
//         .indexWhere((element) => element.columntypeid == 1);
//     qunindex = get.Response11.value.responseData!.auctionColumnHeader!
//         .indexWhere((element) => element.columntypeid == 2);
//     yourrankindex = get.Response11.value.responseData!.auctionColumnHeader!
//         .indexWhere((element) => element.columntypeid == 10005);
//     nextpossindex = get.Response11.value.responseData!.auctionColumnHeader!
//         .indexWhere((element) => element.columntypeid == 10003);
//     lastbidindex = get.Response11.value.responseData!.auctionColumnHeader!
//         .indexWhere((element) => element.columntypeid == 10004);
//     startindex = get.Response11.value.responseData!.auctionColumnHeader!
//         .indexWhere((element) => element.columntypeid == 10001);
//     incrementindex = get.Response11.value.responseData!.auctionColumnHeader!
//         .indexWhere((element) => element.columntypeid == 10007);
//     h1bidindex = get.Response11.value.responseData!.auctionColumnHeader!
//         .indexWhere((element) => element.columntypeid == 10002);
//     totalrateindex = get.Response11.value.responseData!.auctionColumnHeader!
//         .indexWhere((element) => element.columntypeid == 5);
//     return "null";
//   }
//
//   // String NextpossibleValue() {
//   //   final get = Get.put(homeController(context: context));
//   //   final detail = get.Response11.value.responseData!.biddingHallDetail![0];
//   //   final cellValueList = detail.auctionCellValueList!;
//   //   double cellValue1 =
//   //       double.parse(cellValueList[qunindex].cellvalue.toString());
//   //   double next = double.parse(cellValueList[startindex].cellvalue.toString());
//   //   double cellValue5 =
//   //       double.parse(cellValueList[h1bidindex].cellvalue.toString()); //h1
//   //   double cellValue2 = double.parse(
//   //       cellValueList[lastbidindex].cellvalue.toString()); //last bid
//   //   double cellValue7 =
//   //       double.parse(cellValueList[incrementindex].cellvalue.toString()); //inc
//   //   double cellValue3 =
//   //       double.parse(cellValueList[startindex].cellvalue.toString()); //start
//   //   double filledby =
//   //       double.parse(cellValueList[startindex].cellvalue.toString());
//   //
//   //   if (cellValue5 > 0.00) {
//   //     Nextpossible = (cellValue5 + cellValue7).toString();
//   //     TotalRate = ((cellValue5 + cellValue7) * cellValue1).toString();
//   //
//   //     return (cellValue5 + cellValue7).toString();
//   //   } else {
//   //     if (detail.firstbidcond.toString() == "1") {
//   //       Nextpossible = cellValue3.toString();
//   //       TotalRate = (cellValue3 * cellValue1).toString();
//   //
//   //       return cellValue3.toString();
//   //     } else {
//   //       Nextpossible = (cellValue3 + cellValue7).toString();
//   //       TotalRate = ((cellValue3 + cellValue7) * cellValue1).toString();
//   //
//   //       return (cellValue3 + cellValue7).toString();
//   //     }
//   //   }
//   // }
//   //
//   // String Nextpossibledecrement() {
//   //   final get = Get.put(homeController(context: context));
//   //   final detail = get.Response11.value.responseData!.biddingHallDetail![0];
//   //   final cellValueList = detail.auctionCellValueList!;
//   //   double cellValue1 =
//   //       double.parse(cellValueList[qunindex].cellvalue.toString());
//   //   double next = double.parse(cellValueList[startindex].cellvalue.toString());
//   //   double cellValue5 =
//   //       double.parse(cellValueList[h1bidindex].cellvalue.toString()); //h1
//   //   double cellValue2 = double.parse(
//   //       cellValueList[lastbidindex].cellvalue.toString()); //last bid
//   //   double cellValue7 =
//   //       double.parse(cellValueList[incrementindex].cellvalue.toString()); //inc
//   //   double cellValue3 =
//   //       double.parse(cellValueList[startindex].cellvalue.toString()); //start
//   //   double filledby =
//   //       double.parse(cellValueList[startindex].cellvalue.toString());
//   //
//   //   if (cellValue5 > 0.00) {
//   //     Nextpossible = (cellValue5 - cellValue7).toString();
//   //     TotalRate = ((cellValue5 - cellValue7) * cellValue1).toString();
//   //
//   //     return Nextpossible;
//   //   } else {
//   //     if (detail.firstbidcond.toString() == "1") {
//   //       Nextpossible = cellValue3.toString();
//   //       TotalRate = (cellValue3 * cellValue1).toString();
//   //
//   //       return Nextpossible;
//   //     } else {
//   //       Nextpossible = (cellValue3 - cellValue7).toString();
//   //       TotalRate = ((cellValue3 - cellValue7) * cellValue1).toString();
//   //
//   //       return Nextpossible;
//   //     }
//   //   }
//   // }
//   //
//   // String TotalRateValue(a) {
//   //   double next = double.parse(Nextpossible.toString());
//   //
//   //   double con = double.parse(a);
//   //   TotalRate = (next * con).toString();
//   //   return (next * con).toString();
//   // }
//
//   String Remaining(String enddate) {
//     String endDateStr = enddate;
//     DateTime endDate = DateFormat("dd/MM/yyyy HH:mm:ss").parse(endDateStr);
//
//     // Get the current date (without time)
//     DateTime currentDate = DateTime.now();
//     currentDate =
//         DateTime(currentDate.year, currentDate.month, currentDate.day);
//
//     // Calculate the difference in days
//     Duration difference = endDate.difference(currentDate);
//     int remainingDays = difference.inDays;
//     return remainingDays.toString();
//   }
//
//   @override
//   void initState() {
//     TODO: implement initState
//     final get = Get.put(homeController(context: context));
//     final get1 = Get.put(TimerController(context: context));
//     get.autobiddingstates = true;
//     indexf();
//     if (get.autobiddingstates == true) {
//       get1.performTask();
//     }
//     if (get.autobiddingstates == false) {
//       get1.countdownTimer?.cancel();
//     }
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     final get = Get.put(homeController(context: context));
//     get.value.clear();
//     get.autobiddingstates = false;
//     // TODO: implement dispose
//     super.dispose();
//   }
//
//   void _toggleSelected() {
//     setState(() {
//       _isSelected = !_isSelected;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final heights = MediaQuery.of(context).size.height;
//     final widths = MediaQuery.of(context).size.width;
//     final get = Get.put(homeController(context: context));
//
//     final get1 = Get.put(TimerController(context: context));
//     final detail = get.Response11.value.responseData!.biddingHallDetail![0];
//     final cellValueList = detail.auctionCellValueList!;
//     double cellValue1 =
//         double.parse(cellValueList[qunindex].cellvalue.toString());
//
//     double cellValue5 =
//         double.parse(cellValueList[h1bidindex].cellvalue.toString()); //h1
//
//     double cellValue7 =
//         double.parse(cellValueList[incrementindex].cellvalue.toString()); //inc
//     double cellValue3 =
//         double.parse(cellValueList[startindex].cellvalue.toString()); //start
//
//     return GestureDetector(
//       onTap: _toggleSelected,
//       child: Container(
//         margin: EdgeInsets.all(8.0),
//         padding: EdgeInsets.all(16.0),
//         decoration: BoxDecoration(
//           color: _isSelected ? Colors.blue : Colors.grey,
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               width: widths * 0.8,
//               margin: EdgeInsets.all(16),
//               child: Table(
//                 border: TableBorder(
//                   horizontalInside: BorderSide(color: Colors.grey, width: 1),
//                   verticalInside: BorderSide(color: Colors.grey, width: 1),
//                 ),
//                 children: [
//                   TableRow(
//                     children: [
//                       Container(
//                         child: Column(
//                           children: [
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               "Item name",
//                               style: TextStyle(
//                                   color: colors.primary,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(
//                               height: 5,
//                             ),
//                             Text(get
//                                 .Response11
//                                 .value
//                                 .responseData!
//                                 .biddingHallDetail![0]
//                                 .auctionCellValueList![itemnameindex]
//                                 .cellvalue
//                                 .toString()),
//                             SizedBox(
//                               height: 10,
//                             )
//                           ],
//                         ),
//                       ),
//                       Container(
//                         child: Column(
//                           children: [
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               "Your Rank",
//                               style: TextStyle(
//                                   color: colors.primary,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(
//                               height: 5,
//                             ),
//                             Text(get
//                                 .Response11
//                                 .value
//                                 .responseData!
//                                 .biddingHallDetail![0]
//                                 .auctionCellValueList![yourrankindex]
//                                 .cellvalue
//                                 .toString()),
//                             SizedBox(
//                               height: 10,
//                             )
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   TableRow(
//                     children: [
//                       Container(
//                         child: Column(
//                           children: [
//                             SizedBox(
//                               height: 15,
//                             ),
//                             Text(
//                               "Your limit value",
//                               style: TextStyle(
//                                   color: colors.primary,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(
//                               height: 5,
//                             ),
//                             Text(get.value.text),
//                             SizedBox(
//                               height: 10,
//                             )
//                           ],
//                         ),
//                       ),
//                       Container(
//                         child: Column(
//                           children: [
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               "H1 Bid",
//                               style: TextStyle(
//                                   color: colors.primary,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(
//                               height: 5,
//                             ),
//                             Text(get
//                                 .Response11
//                                 .value
//                                 .responseData!
//                                 .biddingHallDetail![0]
//                                 .auctionCellValueList![h1bidindex]
//                                 .cellvalue
//                                 .toString()),
//                             SizedBox(
//                               height: 10,
//                             )
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   TableRow(
//                     children: [
//                       Container(
//                         child: Column(
//                           children: [
//                             SizedBox(
//                               height: 15,
//                             ),
//                             Text(
//                               "Last bid price",
//                               style: TextStyle(
//                                   color: colors.primary,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(
//                               height: 5,
//                             ),
//                             Text(get
//                                 .Response11
//                                 .value
//                                 .responseData!
//                                 .biddingHallDetail![0]
//                                 .auctionCellValueList![lastbidindex]
//                                 .cellvalue
//                                 .toString()),
//                             SizedBox(
//                               height: 10,
//                             )
//                           ],
//                         ),
//                       ),
//                       Container(
//                         child: Column(
//                           children: [
//                             SizedBox(
//                               height: 15,
//                             ),
//                             Text(
//                               "Increment",
//                               style: TextStyle(
//                                   color: colors.primary,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(
//                               height: 5,
//                             ),
//                             Text(get
//                                 .Response11
//                                 .value
//                                 .responseData!
//                                 .biddingHallDetail![0]
//                                 .auctionCellValueList![incrementindex]
//                                 .cellvalue
//                                 .toString()),
//                             // SizedBox(
//                             //   height: 10,
//                             // )
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   // TableRow(
//                   //   children: [
//                   //     Container(
//                   //       child: Column(
//                   //         children: [
//                   //           SizedBox(
//                   //             height: 15,
//                   //           ),
//                   //           Text(
//                   //             "Next possible bid",
//                   //             style: TextStyle(
//                   //                 color: colors.primary,
//                   //                 fontWeight: FontWeight.bold),
//                   //           ),
//                   //           SizedBox(
//                   //             height: 5,
//                   //           ),
//                   //           Text(get
//                   //                       .Response11
//                   //                       .value
//                   //                       .responseData!
//                   //                       .auctionColumnHeader![
//                   //                           nextpossindex]
//                   //                       .filledby
//                   //                       .toString() ==
//                   //                   "1"
//                   //               ? get
//                   //                   .Response11
//                   //                   .value
//                   //                   .responseData!
//                   //                   .biddingHallDetail![0]
//                   //                   .auctionCellValueList![
//                   //                       nextpossindex]
//                   //                   .cellvalue
//                   //                   .toString()
//                   //               : get
//                   //                           .Response11
//                   //                           .value
//                   //                           .responseData!
//                   //                           .biddingHallDetail![0]
//                   //                           .eventtypeid
//                   //                           .toString() ==
//                   //                       "1"
//                   //                   ? cellValue5 > 0.00
//                   //                       ? (cellValue5 + cellValue7)
//                   //                           .toString()
//                   //                       : detail.firstbidcond
//                   //                                   .toString() ==
//                   //                               "1"
//                   //                           ? cellValue3.toString()
//                   //                           : (cellValue3 + cellValue7)
//                   //                               .toString()
//                   //                   : cellValue5 > 0.00
//                   //                       ? (cellValue5 - cellValue7)
//                   //                           .toString()
//                   //                       : detail.firstbidcond
//                   //                                   .toString() ==
//                   //                               "1"
//                   //                           ? cellValue3.toString()
//                   //                           : (cellValue3 - cellValue7)
//                   //                               .toString()),
//                   //           SizedBox(
//                   //             height: 10,
//                   //           )
//                   //         ],
//                   //       ),
//                   //     ),
//                   //     Container(
//                   //       child: Column(
//                   //         children: [
//                   //           SizedBox(
//                   //             height: 15,
//                   //           ),
//                   //           Text(
//                   //             "Total Rate",
//                   //             style: TextStyle(
//                   //                 color: colors.primary,
//                   //                 fontWeight: FontWeight.bold),
//                   //           ),
//                   //           SizedBox(
//                   //             height: 5,
//                   //           ),
//                   //           Text(
//                   //             get
//                   //                         .Response11
//                   //                         .value
//                   //                         .responseData!
//                   //                         .auctionColumnHeader![
//                   //                             nextpossindex]
//                   //                         .filledby
//                   //                         .toString() ==
//                   //                     "1"
//                   //                 ? get
//                   //                     .Response11
//                   //                     .value
//                   //                     .responseData!
//                   //                     .biddingHallDetail![0]
//                   //                     .auctionCellValueList![
//                   //                         nextpossindex]
//                   //                     .cellvalue
//                   //                     .toString()
//                   //                 : get
//                   //                             .Response11
//                   //                             .value
//                   //                             .responseData!
//                   //                             .biddingHallDetail![0]
//                   //                             .eventtypeid
//                   //                             .toString() ==
//                   //                         "1"
//                   //                     ? cellValue5 > 0.00
//                   //                         ? ((cellValue5 + cellValue7) * cellValue1)
//                   //                             .toString()
//                   //                         : detail.firstbidcond.toString() ==
//                   //                                 "1"
//                   //                             ? (cellValue3 * cellValue1)
//                   //                                 .toString()
//                   //                             : ((cellValue3 + cellValue7) * cellValue1)
//                   //                                 .toString()
//                   //                     : cellValue5 > 0.00
//                   //                         ? ((cellValue5 - cellValue7) *
//                   //                                 cellValue1)
//                   //                             .toString()
//                   //                         : detail.firstbidcond.toString() ==
//                   //                                 "1"
//                   //                             ? (cellValue3 * cellValue1)
//                   //                                 .toString()
//                   //                             : ((cellValue3 - cellValue7) *
//                   //                                     cellValue1)
//                   //                                 .toString(),
//                   //           ),
//                   //           SizedBox(
//                   //             height: 10,
//                   //           )
//                   //         ],
//                   //       ),
//                   //     ),
//                   //   ],
//                   // ),
//                 ],
//               ),
//             ),
//             Container(
//               width: widths,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Auto Bidding States",
//                     style: TextStyle(
//                         color: colors.primary, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text("OFF   "),
//                       Switch(
//                         // This bool value toggles the switch.
//                         value: get.autobiddingstates,
//                         activeColor: colors.primary,
//                         onChanged: (bool value) {
//                           setState(() {
//                             get.autobiddingstates = value;
//                             if (value == true) {
//                               get1.performTask();
//                             }
//                             if (get.autobiddingstates == false) {
//                               get1.countdownTimer?.cancel();
//                             }
//                           });
//                           if (get.autobiddingstates == false) {
//                             get1.countdownTimer?.cancel();
//                           }
//                         },
//                       ),
//                       Text("   ON"),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 10,
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               padding: EdgeInsets.all(20),
//               width: widths * 0.8,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: Colors.white,
//                   boxShadow: [
//                     new BoxShadow(
//                       offset: Offset(3, 3),
//                       blurRadius: 30,
//                       spreadRadius: 30,
//                       color: Color.fromRGBO(80, 85, 141, 0.14901960784313725),
//                     )
//                   ]),
//               child: Column(
//                 children: [
//                   Text(
//                     "Your Next Bid in",
//                     style: TextStyle(
//                         color: colors.primary,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   Container(
//                     width: widths * 0.7,
//                     child: Text(
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.bold),
//                         "${get1.remainingSeconds.value.toString()} seconds..."),
//                   ),
//                   // Lottie.asset(
//                   //   paths.gif1,
//                   // ),
//                   // Container(
//                   //   width: widths * 0.7,
//                   //   child: Text(
//                   //       textAlign: TextAlign.center,
//                   //       style: TextStyle(fontSize: 12),
//                   //       "From your bidding value, your current rank is lower than "
//                   //       "desired. To improve your visibility and increase your chances "
//                   //       "of success, we are increasing your bidding value"),
//                   // ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Container(
//               width: widths * 0.8,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Your limit value : ",
//                     style: TextStyle(
//                         color: colors.primary,
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   Text(get.value.text)
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               width: widths * 0.4,
//               height: 50,
//               decoration: BoxDecoration(
//                   border: Border.all(color: colors.primary),
//                   borderRadius: BorderRadius.circular(25)),
//               child: TextButton(
//                   onPressed: () {
//                     Get.toNamed("/autobidding");
//                     get.autobiddingstates = false;
//                   },
//                   child: Text(
//                     "Change Auto value",
//                     style: TextStyle(color: colors.primary),
//                   )),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
