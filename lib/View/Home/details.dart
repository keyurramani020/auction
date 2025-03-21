import 'package:btt/View/Utilites/Colors.dart';
import 'package:btt/controller/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

import '../Widget/widget.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List<bool> tabs = [true, false, false, false, false, false, false, false];
  void handleClick(int index) {
    setState(() {
      for (int i = 0; i < tabs.length; i++) {
        if (i == index) {
          // Toggle the clicked item
          tabs[i] = !tabs[i];
        } else {
          // Set all other items to false
          tabs[i] = false;
        }
      }
    });
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
        get.Auctionlist();
        Get.toNamed("/home");
      },
      child: Obx(() {
        return Scaffold(
            body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                sbh(50.0),
                cappbar(context, widths, "/home"),
                get.loading2.value == true
                    ? SizedBox(
                        width: widths,
                        height: heights * 0.7,
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: colors.primary,
                          ),
                        ),
                      )
                    : Column(
                        children: [
                          sbh(20.0),
                          auctionDetails(widths, get), //Auction Details
                          sbh(20.0),
                          biddingRules(widths, get), //Bidding Rules
                          sbh(20.0),
                          auctionVarient(widths, get), //Auction Varient
                          sbh(20.0), bidders(widths, get), //Bidders
                          sbh(20.0),
                          accessibility(widths, get), //Accessibility
                          sbh(20.0), evalution(widths, get), //Evalution
                          sbh(20.0), location(widths, get), //Location
                          sbh(20.0), time(widths, get), //Time
                          sbh(20.0),
                          bidNow(widths, get),
                          sbh(20.0),
                        ],
                      )

                //  auction details
              ],
            ),
          ),
        ));
      }),
    );
  }

  Widget bidNow(widths, get) {
    return Container(
      width: widths * 0.3,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: colors.primary, borderRadius: BorderRadius.circular(20)),
      child: TextButton(
        onPressed: () {
          get.cellvaluelist.clear();
          get.currentPage.value = 0;
          Get.toNamed("/itemselection");
          get.GetitemSelection(
              get.Response3.value.responseData!.auctionId.toString());
        },
        child: const Text(
          "Bid Now",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget auctionDetails(widths, get) {
    return Container(
      decoration: BoxDecoration(
          color: colors.DBGcolor, borderRadius: BorderRadius.circular(25)),
      width: widths * 0.9,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              handleClick(0);
            },
            child: Container(
              width: widths * 0.9,
              height: 50,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: colors.primary2,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: colors.primary)),
              child: Row(
                children: [
                  sbw(20.0),
                  const SizedBox(
                    child: Text(
                      "Auction Details",
                      style: TextStyle(color: colors.primary),
                    ),
                  ),
                  const Expanded(child: Text("")),
                  Icon(
                    size: 30,
                    tabs[0] ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    color: colors.primary,
                  ),
                  sbw(20.0),
                ],
              ),
            ),
          ),
          tabs[0]
              ? SizedBox(
                  width: widths * 0.9,
                  child: Column(
                    children: [
                      sbh(20.0),
                      Row(
                        children: [
                          sbw(20.0),
                          SizedBox(
                              width: widths * 0.35,
                              child: const Text(
                                "Department",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                          const Text(":   "),
                          SizedBox(
                              width: widths * 0.4,
                              child: Text(get.Response3.value.responseData
                                      ?.departmentName
                                      .toString() ??
                                  " "))
                        ],
                      ),
                      sbh(10.0),
                      Row(
                        children: [
                          sbw(20.0),
                          SizedBox(
                              width: widths * 0.35,
                              child: const Text(
                                "Auction ID",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                          const Text(":   "),
                          SizedBox(
                              width: widths * 0.4,
                              child: Text(get
                                      .Response3.value.responseData?.auctionId
                                      .toString() ??
                                  ""))
                        ],
                      ),
                      sbh(10.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sbw(20.0),
                          SizedBox(
                              width: widths * 0.35,
                              child: const Text(
                                "Auction brief",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                          const Text(":   "),
                          SizedBox(
                              width: widths * 0.4,
                              child: Text(get.Response3.value.responseData
                                      ?.auctionBrief
                                      .toString() ??
                                  ""))
                        ],
                      ),
                      sbh(10.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sbw(20.0),
                          SizedBox(
                              width: widths * 0.35,
                              child: const Text(
                                "Product/ service/ work keyword",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                          const Text(":   "),
                          SizedBox(
                              width: widths * 0.4,
                              child: Text(get
                                      .Response3.value.responseData?.keywordText
                                      .toString() ??
                                  ""))
                        ],
                      ),
                      sbh(10.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sbw(20.0),
                          SizedBox(
                              width: widths * 0.35,
                              child: const Text(
                                "Types of contract",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                          const Text(":   "),
                          SizedBox(
                              width: widths * 0.4,
                              child: Text((get.Response3.value.responseData!
                                          .typeOfAuction ==
                                      1
                                  ? "Goods"
                                  : (get.Response3.value.responseData!
                                              .typeOfAuction ==
                                          2
                                      ? "Service"
                                      : (get.Response3.value.responseData!
                                                  .typeOfAuction ==
                                              3
                                          ? "Work"
                                          : (get.Response3.value.responseData!
                                                      .typeOfAuction ==
                                                  4
                                              ? "Turnkey project"
                                              : (get
                                                          .Response3
                                                          .value
                                                          .responseData!
                                                          .typeOfAuction ==
                                                      5
                                                  ? "Other"
                                                  : "")))))))
                        ],
                      ),
                      sbh(10.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sbw(20.0),
                          SizedBox(
                              width: widths * 0.35,
                              child: const Text(
                                "Remarks",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                          const Text(":   "),
                          SizedBox(
                              width: widths * 0.4,
                              child: Text(get
                                          .Response3.value.responseData!.remarks
                                          .toString() !=
                                      ""
                                  ? get.Response3.value.responseData!.remarks
                                      .toString()
                                  : "No Remark Available"))
                        ],
                      ),
                      sbh(10.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sbw(20.0),
                          SizedBox(
                              width: widths * 0.35,
                              child: const Text(
                                "Officer",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                          const Text(":   "),
                          SizedBox(
                              width: widths * 0.35,
                              child: Text(get.Response3.value.responseData!
                                          .displayOfficerName ==
                                      1
                                  ? (get
                                      .Response3.value.responseData!.officerName
                                      .toString())
                                  : "Authorized officer"))
                        ],
                      ),
                      sbh(10.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sbw(20.0),
                          SizedBox(
                              width: widths * 0.35,
                              child: const Text(
                                "Auction No.",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                          const Text(":   "),
                          SizedBox(
                              width: widths * 0.4,
                              child: Text(get
                                  .Response3.value.responseData!.auctionNo
                                  .toString()))
                        ],
                      ),
                      sbh(10.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sbw(20.0),
                          SizedBox(
                              width: widths * 0.35,
                              child: const Text(
                                "Auction Details",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                          const Text(":   "),
                          SizedBox(
                              width: widths * 0.4,
                              child: HtmlWidget(get
                                  .Response3.value.responseData!.auctionDetail
                                  .toString()))
                        ],
                      ),
                      sbh(20.0),
                    ],
                  ),
                )
              : Container()
        ],
      ),
    );
  }

  Widget biddingRules(widths, get) {
    return Container(
      decoration: BoxDecoration(
          color: colors.DBGcolor, borderRadius: BorderRadius.circular(25)),
      width: widths * 0.9,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              handleClick(1);
            },
            child: Container(
              width: widths * 0.9,
              height: 50,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: colors.primary2,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: colors.primary)),
              child: Row(
                children: [
                  sbw(20.0),
                  const SizedBox(
                    child: Text(
                      "Bidding Rules",
                      style: TextStyle(color: colors.primary),
                    ),
                  ),
                  const Expanded(child: Text("")),
                  Icon(
                    size: 30,
                    tabs[1] ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    color: colors.primary,
                  ),
                  sbw(20.0),
                ],
              ),
            ),
          ),
          tabs[1]
              ? Column(
                  children: [
                    sbh(20.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sbw(20.0),
                        SizedBox(
                            width: widths * 0.35,
                            child: const Text(
                              "Bid submission for",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                        const Text(":   "),
                        SizedBox(
                            width: widths * 0.4,
                            child: Text(get.Response3.value.responseData!
                                        .auctionResult ==
                                    1
                                ? "Grand Total"
                                : (get.Response3.value.responseData!
                                            .incDecType ==
                                        2
                                    ? "Each Line Item"
                                    : "Grand Total & Each Line Item")))
                      ],
                    ),
                    sbh(10.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sbw(20.0),
                        SizedBox(
                            width: widths * 0.35,
                            child: const Text(
                              "Line item wise bid submission time allowed?",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                        const Text(":   "),
                        SizedBox(
                            width: widths * 0.4,
                            child: Text(get.Response3.value.responseData!
                                        .isItemWiseTime ==
                                    1
                                ? "Yes"
                                : "No"))
                      ],
                    ),
                    sbh(10.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sbw(20.0),
                        SizedBox(
                            width: widths * 0.35,
                            child: const Text(
                              "Auto bid allowed?",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                        const Text(":   "),
                        SizedBox(
                            width: widths * 0.4,
                            child: Text(get.Response3.value.responseData!
                                        .isAutoBidAllowed ==
                                    1
                                ? "Allowed"
                                : "No"))
                      ],
                    ),
                    sbh(10.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sbw(20.0),
                        SizedBox(
                            width: widths * 0.35,
                            child: const Text(
                              "First bid acceptance condition",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                        const Text(":   "),
                        SizedBox(
                            width: widths * 0.4,
                            child: Text(get.Response3.value.responseData!
                                        .firstBidCond ==
                                    1
                                ? "Yes"
                                : "No"))
                      ],
                    ),
                    sbh(10.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sbw(20.0),
                        SizedBox(
                            width: widths * 0.35,
                            child: const Text(
                              "Increment/Decreament in multiples",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                        const Text(":   "),
                        SizedBox(
                            width: widths * 0.4,
                            child: Text(get.Response3.value.responseData!
                                        .incDecInMultiple ==
                                    1
                                ? "yes"
                                : "No"))
                      ],
                    ),
                    sbh(10.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sbw(20.0),
                        SizedBox(
                            width: widths * 0.35,
                            child: const Text(
                              "Allowed auto extension?",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                        const Text(":   "),
                        SizedBox(
                            width: widths * 0.4,
                            child: Text(
                                get.Response3.value.responseData!.isAutoExt == 1
                                    ? "Yes"
                                    : "No"))
                      ],
                    ),
                    sbh(10.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sbw(20.0),
                        SizedBox(
                            width: widths * 0.35,
                            child: const Text(
                              "Bidding price increment in",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                        const Text(":   "),
                        SizedBox(
                            width: widths * 0.4,
                            child: Text(
                                get.Response3.value.responseData!.incDecType ==
                                        1
                                    ? "Figure"
                                    : (get.Response3.value.responseData!
                                                .incDecType ==
                                            2
                                        ? "Percentage"
                                        : " ")))
                      ],
                    ),
                    sbw(20.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sbw(20.0),
                        SizedBox(
                            width: widths * 0.35,
                            child: const Text(
                              "Item Selection",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                        const Text(":   "),
                        SizedBox(
                            width: widths * 0.4,
                            child: Text(get.Response3.value.responseData!
                                        .isItemSelection ==
                                    0
                                ? "No"
                                : "Yes"))
                      ],
                    ),
                    sbh(20.0),
                  ],
                )
              : Container()
        ],
      ),
    );
  }

  Widget auctionVarient(widths, get) {
    return Container(
      decoration: BoxDecoration(
          color: colors.DBGcolor, borderRadius: BorderRadius.circular(25)),
      width: widths * 0.9,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              handleClick(2);
            },
            child: Container(
              width: widths * 0.9,
              height: 50,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: colors.primary2,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: colors.primary)),
              child: Row(
                children: [
                  sbw(20.0),
                  const SizedBox(
                    child: Text(
                      "Auction Varient",
                      style: TextStyle(color: colors.primary),
                    ),
                  ),
                  const Expanded(child: Text("")),
                  Icon(
                    size: 30,
                    tabs[2] ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    color: colors.primary,
                  ),
                  sbw(20.0),
                ],
              ),
            ),
          ),
          tabs[2]
              ? Column(
                  children: [
                    sbh(20.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sbw(20.0),
                        SizedBox(
                            width: widths * 0.35,
                            child: const Text(
                              "Demo Auction",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                        const Text(":   "),
                        SizedBox(
                            width: widths * 0.4,
                            child: Text(get.Response3.value.responseData!
                                        .isDemoAuction ==
                                    0
                                ? "No"
                                : "Yes"))
                      ],
                    ),
                    sbh(10.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sbw(20.0),
                        SizedBox(
                            width: widths * 0.35,
                            child: const Text(
                              "Auction varient",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                        const Text(":   "),
                        SizedBox(
                            width: widths * 0.4,
                            child: Text(
                                get.Response3.value.responseData!.eventTypeId ==
                                        1
                                    ? "Forward"
                                    : "Reverse"))
                      ],
                    ),
                    sbh(20.0)
                  ],
                )
              : Container()
        ],
      ),
    );
  }

  Widget bidders(widths, get) {
    return Container(
      decoration: BoxDecoration(
          color: colors.DBGcolor, borderRadius: BorderRadius.circular(25)),
      width: widths * 0.9,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              handleClick(3);
            },
            child: Container(
              width: widths * 0.9,
              height: 50,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: colors.primary2,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: colors.primary)),
              child: Row(
                children: [
                  sbw(20.0),
                  const SizedBox(
                    child: Text(
                      "Auction Details",
                      style: TextStyle(color: colors.primary),
                    ),
                  ),
                  const Expanded(child: Text("")),
                  Icon(
                    size: 30,
                    tabs[3] ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    color: colors.primary,
                  ),
                  sbw(20.0),
                ],
              ),
            ),
          ),
          tabs[3]
              ? Column(
                  children: [
                    sbh(20.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sbw(20.0),
                        SizedBox(
                            width: widths * 0.35,
                            child: const Text(
                              "Bidding type",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                        const Text(":   "),
                        SizedBox(
                            width: widths * 0.4,
                            child: Text(
                                get.Response3.value.responseData!.biddingType ==
                                        1
                                    ? "NCB / Domestic"
                                    : "ICB / Global"))
                      ],
                    ),
                    sbh(10.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sbw(20.0),
                        SizedBox(
                            width: widths * 0.35,
                            child: const Text(
                              "Bidding Access",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                        const Text(":   "),
                        SizedBox(
                            width: widths * 0.4,
                            child: Text(
                                get.Response3.value.responseData!.auctionMode ==
                                        1
                                    ? "Open"
                                    : "Limited"))
                      ],
                    ),
                    sbh(10.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sbw(20.0),
                        SizedBox(
                            width: widths * 0.35,
                            child: const Text(
                              "Auction based currency",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                        const Text(":   "),
                        SizedBox(
                            width: widths * 0.4,
                            child: Text(get
                                .Response3.value.responseData!.defaultCurrency
                                .toString()))
                      ],
                    ),
                    sbh(20.0)
                  ],
                )
              : Container()
        ],
      ),
    );
  }

  Widget accessibility(widths, get) {
    return Container(
      decoration: BoxDecoration(
          color: colors.DBGcolor, borderRadius: BorderRadius.circular(25)),
      width: widths * 0.9,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              handleClick(4);
            },
            child: Container(
              width: widths * 0.9,
              height: 50,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: colors.primary2,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: colors.primary)),
              child: Row(
                children: [
                  sbw(20.0),
                  const SizedBox(
                    child: Text(
                      "Accessibility",
                      style: TextStyle(color: colors.primary),
                    ),
                  ),
                  const Expanded(child: Text("")),
                  Icon(
                    size: 30,
                    tabs[4] ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    color: colors.primary,
                  ),
                  sbw(20.0),
                ],
              ),
            ),
          ),
          tabs[4]
              ? Column(
                  children: [
                    sbh(20.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sbw(20.0),
                        SizedBox(
                            width: widths * 0.35,
                            child: const Text(
                              "Allow mobile bidding",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                        const Text(":   "),
                        SizedBox(
                            width: widths * 0.4,
                            child: Text(get.Response3.value.responseData!
                                        .isMobABAllow ==
                                    0
                                ? "No"
                                : "Yes"))
                      ],
                    ),
                    sbh(20.0)
                  ],
                )
              : Container()
        ],
      ),
    );
  }

  Widget evalution(widths, get) {
    return Container(
      decoration: BoxDecoration(
          color: colors.DBGcolor, borderRadius: BorderRadius.circular(25)),
      width: widths * 0.9,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              handleClick(5);
            },
            child: Container(
              width: widths * 0.9,
              height: 50,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: colors.primary2,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: colors.primary)),
              child: Row(
                children: [
                  sbw(20.0),
                  const SizedBox(
                    child: Text(
                      "Evalution",
                      style: TextStyle(color: colors.primary),
                    ),
                  ),
                  const Expanded(child: Text("")),
                  Icon(
                    size: 30,
                    tabs[5] ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    color: colors.primary,
                  ),
                  sbw(20.0),
                ],
              ),
            ),
          ),
          tabs[5]
              ? Column(
                  children: [
                    sbh(20.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sbw(20.0),
                        SizedBox(
                            width: widths * 0.35,
                            child: const Text(
                              "Evalution required",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                        const Text(":   "),
                        SizedBox(
                            width: widths * 0.4,
                            child: Text(get.Response3.value.responseData!
                                        .isEvaluationReq ==
                                    0
                                ? "No"
                                : "Yes"))
                      ],
                    ),
                    sbh(20.0)
                  ],
                )
              : Container()
        ],
      ),
    );
  }

  Widget location(widths, get) {
    return Container(
      decoration: BoxDecoration(
          color: colors.DBGcolor, borderRadius: BorderRadius.circular(25)),
      width: widths * 0.9,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              handleClick(6);
              setState(() {});
            },
            child: Container(
              width: widths * 0.9,
              height: 50,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: colors.primary2,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: colors.primary)),
              child: Row(
                children: [
                  sbw(20.0),
                  const SizedBox(
                    child: Text(
                      "Location",
                      style: TextStyle(color: colors.primary),
                    ),
                  ),
                  const Expanded(child: Text("")),
                  Icon(
                    size: 30,
                    tabs[6] ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    color: colors.primary,
                  ),
                  sbw(20.0),
                ],
              ),
            ),
          ),
          tabs[6]
              ? Column(
                  children: [
                    sbh(20.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sbw(20.0),
                        SizedBox(
                            width: widths * 0.35,
                            child: const Text(
                              "Product Location",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                        const Text(":   "),
                        SizedBox(
                            width: widths * 0.4,
                            child: Text(get
                                .Response3.value.responseData!.productLocation
                                .toString()))
                      ],
                    ),
                    sbh(20.0)
                  ],
                )
              : Container()
        ],
      ),
    );
  }

  Widget time(widths, get) {
    return Container(
      decoration: BoxDecoration(
          color: colors.DBGcolor, borderRadius: BorderRadius.circular(25)),
      width: widths * 0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              handleClick(7);
            },
            child: Container(
              width: widths * 0.9,
              height: 50,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: colors.primary2,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: colors.primary)),
              child: Row(
                children: [
                  sbw(20.0),
                  const SizedBox(
                    child: Text(
                      "Time",
                      style: TextStyle(color: colors.primary),
                    ),
                  ),
                  const Expanded(child: Text("")),
                  Icon(
                    size: 30,
                    tabs[7] ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    color: colors.primary,
                  ),
                  sbw(20.0)
                ],
              ),
            ),
          ),
          tabs[7]
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    sbh(20.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sbw(20.0),
                        SizedBox(
                            width: widths * 0.35,
                            child: const Text(
                              "Start Date & Time",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                        const Text(":   "),
                        SizedBox(
                            width: widths * 0.4,
                            child: Text(get
                                .Response3.value.responseData!.startDate
                                .toString()))
                      ],
                    ),
                    sbh(10.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sbw(20.0),
                        SizedBox(
                            width: widths * 0.35,
                            child: const Text(
                              "End Date & Time",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                        const Text(":   "),
                        SizedBox(
                            width: widths * 0.4,
                            child: Text((get
                                .Response3.value.responseData!.endDate
                                .toString())))
                      ],
                    ),
                    sbh(20.0),
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}
