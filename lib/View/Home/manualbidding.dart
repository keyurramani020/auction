import 'dart:async';
import 'dart:core';

import 'package:btt/View/Utilites/Colors.dart';
import 'package:btt/View/Utilites/imagepath.dart';
import 'package:btt/controller/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controller/profilecontroller.dart';
import '../Widget/widget.dart';

class ManualBidding extends StatefulWidget {
  const ManualBidding({super.key});

  @override
  State<ManualBidding> createState() => _ManualBiddingState();
}

class _ManualBiddingState extends State<ManualBidding> {
  List<bool> tab = [];
  String _timeLeft = '';
  late Timer _timer;
  String endDateString = "";
  @override
  void initState() {
    super.initState();

    final get = Get.put(homeController(context: context));

    endDateString = get
        .Response6.value.responseData!.biddingHallDetail![0].enddatevirtual
        .toString();

    _calculateTimeLeft();
    _timer = Timer.periodic(
        const Duration(seconds: 1), (Timer t) => _calculateTimeLeft());
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  DateTime _parseEndDateString(String endDateString) {
    // Parse the date string in the format "dd/MM/yyyy HH:mm:ss"
    final DateFormat format = DateFormat("dd/MM/yyyy HH:mm:ss");
    return format.parse(endDateString);
  }

  void _calculateTimeLeft() {
    final now = DateTime.now();
    final endDate = _parseEndDateString(endDateString);
    final difference = endDate.difference(now);

    final days = difference.inDays;
    final hours = difference.inHours % 24;
    final minutes = difference.inMinutes % 60;
    final seconds = difference.inSeconds % 60;

    setState(() {
      _timeLeft = '$days days, $hours hours, $minutes min, $seconds sec left';
    });
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
            'Are you sure you want to leave this page?',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child:
                  const Text('cancel', style: TextStyle(color: colors.primary)),
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

  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    final get = Get.put(homeController(context: context));

    return PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) async {
          if (didPop) {
            return;
          }
          await showBackDialog();
          // final bool shouldPop = a;wait showBackDialog() ?? false;
          // if (context.mounted && shouldPop) {
          //   Navigator.pop(context);
          // }
          // get.GetitemSelection(
          //     get.Response3.value.responseData!.auctionId.toString());
          // Get.toNamed("/itemselection");
          // final bool shouldPop = await _showBackDialog() ?? false;
          // if (context.mounted && shouldPop) {
          //   Navigator.pop(context);
          // }
        },
        child: Obx(() {
          return Scaffold(
              body: Center(
            child: Column(
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
                          icon: Icon(Icons.arrow_back_ios_sharp)),
                      // TextButton(
                      //   onPressed: () {
                      //     Get.toNamed(pagename);
                      //   },
                      //   child: Container(
                      //     width: 60,
                      //     child:,
                      //   ),
                      // ),
                      SizedBox(
                        width: widths * 0.6,
                      ),
                      IconButton(
                        onPressed: () {
                          final get1 =
                              Get.put(profileController(context: context));
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
                    style: TextStyle(
                        color: colors.primary, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: widths * 0.95,
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    child: const Text(
                      "Bid log >>",
                      style: TextStyle(color: colors.primary),
                    ),
                    onPressed: () {
                      get.Bidlog("0");
                      Get.toNamed("/BidLogpage");
                    },
                  ),
                ),
                Container(
                  width: widths * 0.95,
                  decoration: BoxDecoration(
                      color: colors.background1,
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: widths * 0.9,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            sbh(15.0),
                            SizedBox(
                              width: widths * 0.9,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: widths * 0.13,
                                    child: const Text(
                                      "Start Date",
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ),
                                  const Text(
                                    ": ",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Text(
                                    (get
                                                .Response6
                                                .value
                                                .responseData
                                                ?.biddingHallDetail
                                                ?.isNotEmpty ??
                                            false)
                                        ? get.Response6.value.responseData!
                                            .biddingHallDetail![0].startdate
                                            .toString()
                                        : 'No data available',
                                    style: const TextStyle(fontSize: 10),
                                  ),
                                  const Expanded(child: Text("")),
                                  SizedBox(
                                    width: widths * 0.27,
                                    child: const Text(
                                      "Current Extensions",
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ),
                                  const Text(
                                    ": ",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Text(
                                    (get
                                                .Response6
                                                .value
                                                .responseData
                                                ?.biddingHallDetail
                                                ?.isNotEmpty ??
                                            false)
                                        ? get.Response6.value.responseData!
                                            .biddingHallDetail![0].currentext
                                            .toString()
                                        : 'No data available',
                                    style: const TextStyle(fontSize: 10),
                                  )
                                ],
                              ),
                            ),
                            sbh(5.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: widths * 0.13,
                                  child: const Text(
                                    "End Date",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                                const Text(
                                  ": ",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Text(
                                  (get.Response6.value.responseData
                                              ?.biddingHallDetail?.isNotEmpty ??
                                          false)
                                      ? get.Response6.value.responseData!
                                          .biddingHallDetail![0].enddate
                                          .toString()
                                      : 'No data available',
                                  style: const TextStyle(fontSize: 10),
                                ),
                                const Expanded(child: Text("")),
                                SizedBox(
                                  width: widths * 0.27,
                                  child: const Text(
                                    "Total Extensions",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                                const Text(
                                  ": ",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Text(
                                  (get.Response6.value.responseData
                                              ?.biddingHallDetail?.isNotEmpty ??
                                          false)
                                      ? get.Response6.value.responseData!
                                          .biddingHallDetail![0].totalext
                                          .toString()
                                      : 'No data available',
                                  style: const TextStyle(fontSize: 10),
                                )
                              ],
                            ),
                            sbh(5.0),
                            // Center(
                            //   child: Obx(() {
                            //     if (controller.isLoading.value) {
                            //       return CircularProgressIndicator();
                            //     } else if (controller.hasError.value) {
                            //       return Text('Failed to load end date',
                            //           style: TextStyle(fontSize: 20));
                            //     } else {
                            //       return Text(controller.timeLeft,
                            //           style: TextStyle(fontSize: 20));
                            //     }
                            //   }),
                            // ),
                            SizedBox(
                              width: widths * 0.9,
                              child: Text(
                                _timeLeft,
                                style: const TextStyle(
                                    color: colors.primary,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SizedBox(
                      width: widths,
                      child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return ExpandableListView(
                            key: ValueKey(index),
                            index: index,
                          );
                        },
                        itemCount: get.Response6.value.responseData!
                            .biddingHallDetail?.length,
                      )),
                )
              ],
            ),
          ));
        }));
  }
}

class ExpandableListView extends StatefulWidget {
  final int index;

  const ExpandableListView({super.key, required this.index});

  @override
  _ExpandableListViewState createState() => _ExpandableListViewState();
}

class _ExpandableListViewState extends State<ExpandableListView> {
  final GlobalKey _key1 = GlobalKey();
  final GlobalKey _key2 = GlobalKey();
  //final TextEditingController _controllers = TextEditingController();
  bool expandFlag = false;
  String totalRate = "";
  String nextpossible = "";
  int itemnameindex = -1;
  int qunindex = -1;
  int yourrankindex = -1;
  int nextpossindex = -1;
  int lastbidindex = -1;
  int startindex = -1;
  int incrementindex = -1;
  int h1bidindex = -1;
  int totalrateindex = -1;

  // String Nextbid() {
  //   final get = Get.put(homeController(context: context));
  //
  //   final detail =
  //       get.Response6.value.responseData!.biddingHallDetail![widget.index];
  //   final cellValueList = detail.auctionCellValueList!;
  //   double cellValue1 =
  //       double.parse(cellValueList[qunindex].cellvalue.toString());
  //
  //   double cellValue5 =
  //       double.parse(cellValueList[h1bidindex].cellvalue.toString()); //h1
  //
  //   double cellValue7 =
  //       double.parse(cellValueList[incrementindex].cellvalue.toString()); //inc
  //   double cellValue3 =
  //       double.parse(cellValueList[startindex].cellvalue.toString()); //start
  //
  //   if (get.Response6.value.responseData!.auctionColumnHeader![nextpossindex]
  //           .filledby
  //           .toString() ==
  //       "1") {
  //     return get.Response6.value.responseData!.biddingHallDetail![widget.index]
  //         .auctionCellValueList![nextpossindex].cellvalue
  //         .toString();
  //   } else {
  //     if (get.Response6.value.responseData!.biddingHallDetail![widget.index]
  //             .eventtypeid
  //             .toString() ==
  //         "1") {
  //       if (cellValue5 > 0.00) {
  //         return (cellValue5 + cellValue7).toString();
  //       } else {
  //         if (detail.firstbidcond.toString() == "1") {
  //           return cellValue3.toString();
  //         } else {
  //           return (cellValue3 + cellValue7).toString();
  //         }
  //       }
  //     } else {
  //       if (cellValue5 > 0.00) {
  //         return Nextpossible;
  //       } else {
  //         if (detail.firstbidcond.toString() == "1") {
  //           return Nextpossible;
  //         } else {
  //           return Nextpossible;
  //         }
  //       }
  //     }
  //   }
  // }

  // String TotalRateValue(a) {
  //   double next = double.parse(Nextpossible.toString());
  //
  //   double con = double.parse(a);
  //   TotalRate = (next * con).toString();
  //   return (next * con).toString();
  // }

  @override
  void initState() {
    final get = Get.put(homeController(context: context));

    itemnameindex = get.Response6.value.responseData!.auctionColumnHeader!
        .indexWhere((element) => element.columntypeid == 1);
    qunindex = get.Response6.value.responseData!.auctionColumnHeader!
        .indexWhere((element) => element.columntypeid == 2);
    yourrankindex = get.Response6.value.responseData!.auctionColumnHeader!
        .indexWhere((element) => element.columntypeid == 10005);
    nextpossindex = get.Response6.value.responseData!.auctionColumnHeader!
        .indexWhere((element) => element.columntypeid == 10003);
    lastbidindex = get.Response6.value.responseData!.auctionColumnHeader!
        .indexWhere((element) => element.columntypeid == 10004);
    startindex = get.Response6.value.responseData!.auctionColumnHeader!
        .indexWhere((element) => element.columntypeid == 10001);
    incrementindex = get.Response6.value.responseData!.auctionColumnHeader!
        .indexWhere((element) => element.columntypeid == 10007);
    h1bidindex = get.Response6.value.responseData!.auctionColumnHeader!
        .indexWhere((element) => element.columntypeid == 10002);
    totalrateindex = get.Response6.value.responseData!.auctionColumnHeader!
        .indexWhere((element) => element.columntypeid == 5);
    // Nextbid();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final widths = MediaQuery.of(context).size.width;
    final get = Get.put(homeController(context: context));
    final detail =
        get.Response6.value.responseData!.biddingHallDetail![widget.index];
    final cellValueList = detail.auctionCellValueList!;
    double cellValue1 =
        double.parse(cellValueList[qunindex].cellvalue.toString());

    double cellValue5 =
        double.parse(cellValueList[h1bidindex].cellvalue.toString()); //h1

    double cellValue7 =
        double.parse(cellValueList[incrementindex].cellvalue.toString()); //inc
    double cellValue3 =
        double.parse(cellValueList[startindex].cellvalue.toString()); //start

    return Obx(() {
      return expandFlag
          ? Column(
              key: _key1,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          expandFlag = !expandFlag;
                        });
                      },
                      icon: Icon(
                        expandFlag ? Icons.arrow_drop_down : Icons.arrow_right,
                        size: 30,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: widths * 0.2,
                                  child: Text(
                                    get
                                            .Response6
                                            .value
                                            .responseData!
                                            .auctionColumnHeader![itemnameindex]
                                            .columnheader
                                            .toString()
                                            .capitalize ??
                                        "",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                const Text(": "),
                                SizedBox(
                                  width: widths * 0.3,
                                  child: Text(
                                    get
                                        .Response6
                                        .value
                                        .responseData!
                                        .biddingHallDetail![widget.index]
                                        .auctionCellValueList![itemnameindex]
                                        .cellvalue
                                        .toString(),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: widths * 0.20,
                                  child: const Text(
                                    "H1 Bid",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                const Text(": "),
                                Text(
                                  get
                                      .Response6
                                      .value
                                      .responseData!
                                      .biddingHallDetail![widget.index]
                                      .auctionCellValueList![h1bidindex]
                                      .cellvalue
                                      .toString(),
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: widths * 0.05,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                    width: widths * 0.15,
                                    child: const Text("Your Rank",
                                        style: TextStyle(fontSize: 12))),
                                const Text(": "),
                                Text(
                                  get
                                      .Response6
                                      .value
                                      .responseData!
                                      .biddingHallDetail![widget.index]
                                      .auctionCellValueList![yourrankindex]
                                      .cellvalue
                                      .toString(),
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: widths * 0.15,
                                  child: const Text(
                                    "Quantity",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                const Text(": "),
                                Text(
                                  get
                                      .Response6
                                      .value
                                      .responseData!
                                      .biddingHallDetail![widget.index]
                                      .auctionCellValueList![qunindex]
                                      .cellvalue
                                      .toString(),
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: widths * 0.9,
                  decoration: BoxDecoration(
                      color: colors.primary2,
                      borderRadius: BorderRadius.circular(16)),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                      width: widths * 0.18,
                                      child: const Text(
                                        "Lastbid price",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  const Text(":  "),
                                  Text(
                                    get
                                        .Response6
                                        .value
                                        .responseData!
                                        .biddingHallDetail![widget.index]
                                        .auctionCellValueList![lastbidindex]
                                        .cellvalue
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 10,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                      width: widths * 0.18,
                                      child: const Text(
                                        "Start price",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  const Text(":  "),
                                  Text(
                                    get
                                        .Response6
                                        .value
                                        .responseData!
                                        .biddingHallDetail![widget.index]
                                        .auctionCellValueList![startindex]
                                        .cellvalue
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 10,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(0, (index) {
                                  return Center(
                                    child: Row(
                                      children: [
                                        SizedBox(
                                            width: widths * 0.18,
                                            child: const Text(
                                              "Lastbid price",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        const Text(":  "),
                                        Text(
                                          get
                                              .Response6
                                              .value
                                              .responseData!
                                              .biddingHallDetail![widget.index]
                                              .auctionCellValueList![
                                                  lastbidindex]
                                              .cellvalue
                                              .toString(),
                                          style: const TextStyle(
                                            fontSize: 10,
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                              ),
                            ],
                          ),
                          const Expanded(child: Text("")),
                          Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                      width: widths * 0.23,
                                      child: const Text(
                                        "Nextpossible bid",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  const Text(":  "),
                                  Text(
                                    get
                                                .Response6
                                                .value
                                                .responseData!
                                                .auctionColumnHeader![
                                                    nextpossindex]
                                                .filledby
                                                .toString() ==
                                            "1"
                                        ? get
                                            .Response6
                                            .value
                                            .responseData!
                                            .biddingHallDetail![widget.index]
                                            .auctionCellValueList![
                                                nextpossindex]
                                            .cellvalue
                                            .toString()
                                        : get
                                                    .Response6
                                                    .value
                                                    .responseData!
                                                    .biddingHallDetail![
                                                        widget.index]
                                                    .eventtypeid
                                                    .toString() ==
                                                "1"
                                            ? cellValue5 > 0.00
                                                ? (cellValue5 + cellValue7)
                                                    .toString()
                                                : detail.firstbidcond
                                                            .toString() ==
                                                        "1"
                                                    ? cellValue3.toString()
                                                    : (cellValue3 + cellValue7)
                                                        .toString()
                                            : cellValue5 > 0.00
                                                ? (cellValue5 - cellValue7)
                                                    .toString()
                                                : detail.firstbidcond
                                                            .toString() ==
                                                        "1"
                                                    ? cellValue3.toString()
                                                    : (cellValue3 - cellValue7)
                                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 10,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                      width: widths * 0.23,
                                      child: Text(
                                        get
                                                .Response6
                                                .value
                                                .responseData!
                                                .auctionColumnHeader![
                                                    incrementindex]
                                                .columnheader
                                                .toString()
                                                .capitalize ??
                                            "",
                                        style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  const Text(":  "),
                                  Text(
                                    get
                                        .Response6
                                        .value
                                        .responseData!
                                        .biddingHallDetail![widget.index]
                                        .auctionCellValueList![incrementindex]
                                        .cellvalue
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 10,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(0, (index) {
                                  return Center(
                                    child: Row(
                                      children: [
                                        SizedBox(
                                            width: widths * 0.18,
                                            child: const Text(
                                              "Lastbid price",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        const Text(":  "),
                                        Text(
                                          get
                                              .Response6
                                              .value
                                              .responseData!
                                              .biddingHallDetail![widget.index]
                                              .auctionCellValueList![
                                                  lastbidindex]
                                              .cellvalue
                                              .toString(),
                                          style: const TextStyle(
                                            fontSize: 10,
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                              ),
                            ],
                          )
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const SizedBox(
                                      width: 70,
                                      child: Text(
                                        "Total Rate",
                                        style: TextStyle(
                                            color: colors.primary,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  const Text(": "),
                                  Text(
                                    get
                                                .Response6
                                                .value
                                                .responseData!
                                                .auctionColumnHeader![
                                                    nextpossindex]
                                                .filledby
                                                .toString() ==
                                            "1"
                                        ? get
                                            .Response6
                                            .value
                                            .responseData!
                                            .biddingHallDetail![widget.index]
                                            .auctionCellValueList![
                                                nextpossindex]
                                            .cellvalue
                                            .toString()
                                        : get
                                                    .Response6
                                                    .value
                                                    .responseData!
                                                    .biddingHallDetail![
                                                        widget.index]
                                                    .eventtypeid
                                                    .toString() ==
                                                "1"
                                            ? cellValue5 > 0.00
                                                ? ((cellValue5 + cellValue7) *
                                                        cellValue1)
                                                    .toString()
                                                : detail.firstbidcond.toString() ==
                                                        "1"
                                                    ? (cellValue3 * cellValue1)
                                                        .toString()
                                                    : ((cellValue3 + cellValue7) *
                                                            cellValue1)
                                                        .toString()
                                            : cellValue5 > 0.00
                                                ? ((cellValue5 - cellValue7) *
                                                        cellValue1)
                                                    .toString()
                                                : detail.firstbidcond
                                                            .toString() ==
                                                        "1"
                                                    ? (cellValue3 * cellValue1).toString()
                                                    : ((cellValue3 - cellValue7) * cellValue1).toString(),
                                    // UnitrateValue(_controllers ?? 1),
                                    style: const TextStyle(
                                      fontSize: 10,
                                    ),
                                  )
                                ],
                              ),
                              sbh(10.0),
                              Row(
                                children: [
                                  SizedBox(
                                      width: widths * 0.2,
                                      child: const Text(
                                        "Unit rate",
                                        style: TextStyle(
                                            color: colors.primary,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  const Text(": "),
                                  Container(
                                      width: widths * 0.45,
                                      height: 35,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(get
                                                  .Response6
                                                  .value
                                                  .responseData!
                                                  .auctionColumnHeader![
                                                      nextpossindex]
                                                  .filledby
                                                  .toString() ==
                                              "1"
                                          ? get
                                              .Response6
                                              .value
                                              .responseData!
                                              .biddingHallDetail![widget.index]
                                              .auctionCellValueList![
                                                  nextpossindex]
                                              .cellvalue
                                              .toString()
                                          : get
                                                      .Response6
                                                      .value
                                                      .responseData!
                                                      .biddingHallDetail![
                                                          widget.index]
                                                      .eventtypeid
                                                      .toString() ==
                                                  "1"
                                              ? cellValue5 > 0.00
                                                  ? (cellValue5 + cellValue7).toString()
                                                  : detail.firstbidcond.toString() == "1"
                                                      ? cellValue3.toString()
                                                      : (cellValue3 + cellValue7).toString()
                                              : cellValue5 > 0.00
                                                  ? (cellValue5 - cellValue7).toString()
                                                  : detail.firstbidcond.toString() == "1"
                                                      ? cellValue3.toString()
                                                      : (cellValue3 - cellValue7).toString()))
                                ],
                              ),
                            ],
                          ),
                          const Expanded(child: Text("")),
                          GestureDetector(
                            onTap: () async {
                              //print("_controllers.text:" + _controllers.text);
                              String table = get
                                  .Response6
                                  .value
                                  .responseData!
                                  .biddingHallDetail![0]
                                  .auctionCellValueList![0]
                                  .tableid
                                  .toString();
                              String row = get
                                  .Response6
                                  .value
                                  .responseData!
                                  .biddingHallDetail![widget.index]
                                  .auctionCellValueList![0]
                                  .rowid
                                  .toString();
                              String trci = get
                                  .Response6
                                  .value
                                  .responseData!
                                  .biddingHallDetail![widget.index]
                                  .auctionCellValueList![totalrateindex]
                                  .cellid
                                  .toString();
                              String totalRatecellValue = get
                                  .Response6
                                  .value
                                  .responseData!
                                  .biddingHallDetail![widget.index]
                                  .auctionCellValueList![totalrateindex]
                                  .cellvalue
                                  .toString();
                              String next = get
                                          .Response6
                                          .value
                                          .responseData!
                                          .auctionColumnHeader![nextpossindex]
                                          .filledby
                                          .toString() ==
                                      "1"
                                  ? get
                                      .Response6
                                      .value
                                      .responseData!
                                      .biddingHallDetail![widget.index]
                                      .auctionCellValueList![nextpossindex]
                                      .cellvalue
                                      .toString()
                                  : get
                                              .Response6
                                              .value
                                              .responseData!
                                              .biddingHallDetail![widget.index]
                                              .eventtypeid
                                              .toString() ==
                                          "1"
                                      ? cellValue5 > 0.00
                                          ? (cellValue5 + cellValue7).toString()
                                          : detail.firstbidcond.toString() ==
                                                  "1"
                                              ? cellValue3.toString()
                                              : (cellValue3 + cellValue7)
                                                  .toString()
                                      : cellValue5 > 0.00
                                          ? (cellValue5 - cellValue7).toString()
                                          : detail.firstbidcond.toString() ==
                                                  "1"
                                              ? cellValue3.toString()
                                              : (cellValue3 - cellValue7)
                                                  .toString();
                              String total = get
                                          .Response6
                                          .value
                                          .responseData!
                                          .auctionColumnHeader![nextpossindex]
                                          .filledby
                                          .toString() ==
                                      "1"
                                  ? get
                                      .Response6
                                      .value
                                      .responseData!
                                      .biddingHallDetail![widget.index]
                                      .auctionCellValueList![nextpossindex]
                                      .cellvalue
                                      .toString()
                                  : get
                                              .Response6
                                              .value
                                              .responseData!
                                              .biddingHallDetail![widget.index]
                                              .eventtypeid
                                              .toString() ==
                                          "1"
                                      ? cellValue5 > 0.00
                                          ? ((cellValue5 + cellValue7) * cellValue1)
                                              .toString()
                                          : detail.firstbidcond.toString() ==
                                                  "1"
                                              ? (cellValue3 * cellValue1)
                                                  .toString()
                                              : ((cellValue3 + cellValue7) *
                                                      cellValue1)
                                                  .toString()
                                      : cellValue5 > 0.00
                                          ? ((cellValue5 - cellValue7) * cellValue1)
                                              .toString()
                                          : detail.firstbidcond.toString() ==
                                                  "1"
                                              ? (cellValue3 * cellValue1)
                                                  .toString()
                                              : ((cellValue3 - cellValue7) *
                                                      cellValue1)
                                                  .toString();
                              get.Bidsubmit(table, row, next, total, trci,
                                  totalRatecellValue);

                              // if (get.Response8.value.responseData
                              //         ?.bidResponseMessage
                              //         .toString() ==
                              //     "Your bid is accepted.") {
                              //   Get.toNamed("/manualbidding");
                              // }

                              // final FlutterTts flutterTts = FlutterTts();
                              //
                              // await flutterTts.setLanguage("en-US");
                              // await flutterTts.setPitch(1.0);
                              // await flutterTts.speak(get
                              //     .Response6
                              //     .value
                              //     .responseData!
                              //     .biddingHallDetail![widget.index]
                              //     .auctionCellValueList![h1bidindex]
                              //     .cellvalue
                              //     .toString());
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              alignment: Alignment.center,
                              child: Image.asset(
                                paths.auction,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                sbh(20.0)
              ],
            )
          : Column(
              key: _key2,
              children: [
                SizedBox(
                  width: widths * 0.98,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            expandFlag = !expandFlag;
                          });
                        },
                        icon: Icon(
                          expandFlag
                              ? Icons.arrow_drop_down
                              : Icons.arrow_right,
                          size: 30,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: widths * 0.15,
                                child: const Text(
                                  "Item name",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const Text(": ", style: TextStyle(fontSize: 10)),
                              SizedBox(
                                width: widths * 0.15,
                                child: Text(
                                  get
                                      .Response6
                                      .value
                                      .responseData!
                                      .biddingHallDetail![widget.index]
                                      .auctionCellValueList![itemnameindex]
                                      .cellvalue
                                      .toString(),
                                  style: const TextStyle(fontSize: 10),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: widths * 0.15,
                                child: const Text(
                                  "Quantity",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                              const Text(": ", style: TextStyle(fontSize: 10)),
                              Text(
                                  get
                                      .Response6
                                      .value
                                      .responseData!
                                      .biddingHallDetail![widget.index]
                                      .auctionCellValueList![qunindex]
                                      .cellvalue
                                      .toString(),
                                  style: const TextStyle(fontSize: 10))
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: widths * 0.15,
                                child: const Text(
                                  "Your rank",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                              const Text(": ", style: TextStyle(fontSize: 10)),
                              Text(
                                get
                                    .Response6
                                    .value
                                    .responseData!
                                    .biddingHallDetail![widget.index]
                                    .auctionCellValueList![yourrankindex]
                                    .cellvalue
                                    .toString(),
                                style: const TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Expanded(child: Text("")),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: widths * 0.12,
                            child: const Text(
                              "Unit rate :",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                              width: widths * 0.4,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: colors.primary2,
                                  borderRadius: BorderRadius.circular(4)),
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(get
                                          .Response6
                                          .value
                                          .responseData!
                                          .auctionColumnHeader![nextpossindex]
                                          .filledby
                                          .toString() ==
                                      "1"
                                  ? get
                                      .Response6
                                      .value
                                      .responseData!
                                      .biddingHallDetail![widget.index]
                                      .auctionCellValueList![nextpossindex]
                                      .cellvalue
                                      .toString()
                                  : get
                                              .Response6
                                              .value
                                              .responseData!
                                              .biddingHallDetail![widget.index]
                                              .eventtypeid
                                              .toString() ==
                                          "1"
                                      ? cellValue5 > 0.00
                                          ? (cellValue5 + cellValue7).toString()
                                          : detail.firstbidcond.toString() ==
                                                  "1"
                                              ? cellValue3.toString()
                                              : (cellValue3 + cellValue7)
                                                  .toString()
                                      : cellValue5 > 0.00
                                          ? (cellValue5 - cellValue7).toString()
                                          : detail.firstbidcond.toString() ==
                                                  "1"
                                              ? cellValue3.toString()
                                              : (cellValue3 - cellValue7)
                                                  .toString())
                              // TextField(
                              //   cursorColor: colors.primary,
                              //   decoration: InputDecoration(
                              //     border: InputBorder.none,
                              //     hintText: NextpossibleValue(),
                              //     contentPadding: const EdgeInsets.only(
                              //         left: 10, bottom: 10),
                              //   ),
                              //   controller: _controllers,
                              //   keyboardType: TextInputType.number,
                              // ),
                              )
                        ],
                      ),
                      const Expanded(child: Text("")),
                      Column(
                        children: [
                          const SizedBox(
                            height: 18,
                          ),
                          GestureDetector(
                            onTap: () async {
                              //print("_controllers.text:" + _controllers.text);
                              String table = get
                                  .Response6
                                  .value
                                  .responseData!
                                  .biddingHallDetail![0]
                                  .auctionCellValueList![0]
                                  .tableid
                                  .toString();
                              String row = get
                                  .Response6
                                  .value
                                  .responseData!
                                  .biddingHallDetail![widget.index]
                                  .auctionCellValueList![0]
                                  .rowid
                                  .toString();
                              String trci = get
                                  .Response6
                                  .value
                                  .responseData!
                                  .biddingHallDetail![widget.index]
                                  .auctionCellValueList![totalrateindex]
                                  .cellid
                                  .toString();
                              String totalRatecellValue = get
                                  .Response6
                                  .value
                                  .responseData!
                                  .biddingHallDetail![widget.index]
                                  .auctionCellValueList![totalrateindex]
                                  .cellvalue
                                  .toString();
                              String next = get
                                          .Response6
                                          .value
                                          .responseData!
                                          .auctionColumnHeader![nextpossindex]
                                          .filledby
                                          .toString() ==
                                      "1"
                                  ? get
                                      .Response6
                                      .value
                                      .responseData!
                                      .biddingHallDetail![widget.index]
                                      .auctionCellValueList![nextpossindex]
                                      .cellvalue
                                      .toString()
                                  : get
                                              .Response6
                                              .value
                                              .responseData!
                                              .biddingHallDetail![widget.index]
                                              .eventtypeid
                                              .toString() ==
                                          "1"
                                      ? cellValue5 > 0.00
                                          ? (cellValue5 + cellValue7).toString()
                                          : detail.firstbidcond.toString() ==
                                                  "1"
                                              ? cellValue3.toString()
                                              : (cellValue3 + cellValue7)
                                                  .toString()
                                      : cellValue5 > 0.00
                                          ? (cellValue5 - cellValue7).toString()
                                          : detail.firstbidcond.toString() ==
                                                  "1"
                                              ? cellValue3.toString()
                                              : (cellValue3 - cellValue7)
                                                  .toString();
                              String total = get
                                          .Response6
                                          .value
                                          .responseData!
                                          .auctionColumnHeader![nextpossindex]
                                          .filledby
                                          .toString() ==
                                      "1"
                                  ? get
                                      .Response6
                                      .value
                                      .responseData!
                                      .biddingHallDetail![widget.index]
                                      .auctionCellValueList![nextpossindex]
                                      .cellvalue
                                      .toString()
                                  : get
                                              .Response6
                                              .value
                                              .responseData!
                                              .biddingHallDetail![widget.index]
                                              .eventtypeid
                                              .toString() ==
                                          "1"
                                      ? cellValue5 > 0.00
                                          ? ((cellValue5 + cellValue7) * cellValue1)
                                              .toString()
                                          : detail.firstbidcond.toString() ==
                                                  "1"
                                              ? (cellValue3 * cellValue1)
                                                  .toString()
                                              : ((cellValue3 + cellValue7) *
                                                      cellValue1)
                                                  .toString()
                                      : cellValue5 > 0.00
                                          ? ((cellValue5 - cellValue7) * cellValue1)
                                              .toString()
                                          : detail.firstbidcond.toString() ==
                                                  "1"
                                              ? (cellValue3 * cellValue1)
                                                  .toString()
                                              : ((cellValue3 - cellValue7) *
                                                      cellValue1)
                                                  .toString();
                              get.Bidsubmit(table, row, next, total, trci,
                                  totalRatecellValue);

                              // if (get.Response8.value.responseData
                              //         ?.bidResponseMessage
                              //         .toString() ==
                              //     "Your bid is accepted.") {
                              //   Get.toNamed("/manualbidding");
                              // }
                              //
                              //
                              //
                              // await flutterTts.setLanguage("en-US");
                              // await flutterTts.setPitch(1.0);
                              // await flutterTts.speak(get
                              //     .Response6
                              //     .value
                              //     .responseData!
                              //     .biddingHallDetail![widget.index]
                              //     .auctionCellValueList![h1bidindex]
                              //     .cellvalue
                              //     .toString());
                            },
                            child: Container(
                              width: 25,
                              height: 25,
                              alignment: Alignment.center,
                              child: Image.asset(
                                paths.auction,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      sbw(10.0)
                    ],
                  ),
                ),
                const Divider(),
                sbh(10.0)
              ],
            );
    });
  }
}
