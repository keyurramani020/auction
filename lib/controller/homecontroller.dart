import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:btt/Apiservice/apiservice.dart';
import 'package:btt/View/Widget/widget.dart';
import 'package:btt/controller/profilecontroller.dart';
import 'package:btt/controller/timercontroller.dart';
import 'package:btt/controller/websocketcontroller.dart';
import 'package:btt/model/AfterloginAuctionlistModel.dart';
import 'package:btt/model/AuctionDetailmodel.dart';
import 'package:btt/model/BidSubmitAllmodel.dart';
import 'package:btt/model/BidSubmitmodel.dart';
import 'package:btt/model/DynBiddingHallModel.dart';
import 'package:btt/model/GetItemSelectionmodel.dart';
import 'package:btt/model/GetUploadedDocsModel.dart';
import 'package:btt/model/ItemBidderMapModel.dart';
import 'package:btt/model/TermConditionsmodel.dart';
import 'package:btt/model/UnauthAuctionlist.dart';
import 'package:btt/model/downloadfilemodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
//import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../View/Utilites/Colors.dart';
import '../View/Utilites/strings.dart';
import '../model/BidLogmodel.dart';
import '../model/viewbidlinksmodel.dart';

class homeController extends GetxController {
  BuildContext context;
  homeController({required this.context});
  var Response1 = UnauthAuctionlist().obs;
  var Response2 = AfterLoginAuctionlistModel().obs;
  var Response3 = AuctionDetailModel().obs;
  var Response4 = TermConditionsModel().obs;
  var Response5 = GetItemSelection().obs;
  var Response6 = DynBiddingHall().obs;
  var Response7 = ItemBidderMap().obs;
  var Response8 = BidSubmit().obs;
  var Response9 = BidSubmitAll().obs;
  var Response10 = Bidlogmodel().obs;
  var Response11 = DynBiddingHall().obs;
  var Response12 = getuploadeddocs().obs;
  var Response13 = downloadfile().obs;
  var Response14 = viewbiddinghalllinks().obs;

  var loading1 = false.obs;
  var loading2 = false.obs;
  var loading3 = false.obs;
  var loading4 = false.obs;
  var loading5 = false.obs;
  var loading6 = false.obs;
  var loading7 = false.obs;
  var loading8 = false.obs;
  var loading9 = false.obs;
  var loading10 = false.obs;
  var loading11 = false.obs;
  var loading12 = false.obs;
  var loading13 = false.obs;
  var loading14 = false.obs;
  var loading15 = false.obs;

  var auctionlist = [].obs;
  var headerlist = ["a"].obs;
  var cellvaluelist = [].obs;
  var itemsubmit = [].obs;
  var auctionColumnHeader = [].obs;
  var getupdocslist = [].obs;
  var auth = false.obs;
  var bidTerm = "".obs;
  var items = 20.obs;
  var pagecount = 0.obs;
  var itemselectioncount = 0.obs;
  var objectid = "".obs;
  var auctionid = "".obs;
  var autobiddingstates = false.obs;
  var voicestates = false.obs;

  String TotalRate = "";
  String Nextpossible = "";
  // int itemnameindex = -1;
  int qunindex = -1;
  int yourrankindex = -1;
  int nextpossindex = -1;
  //int lastbidindex = -1;
  int startindex = -1;
  int incrementindex = -1;
  int h1bidindex = -1;
  int totalrateindex = -1;
  var currentPage = 0.obs;
  bool isLoading = false;
  var yourrank = 0.obs;
  final _formKey = GlobalKey<FormState>();
  var scrollController1 = ScrollController().obs;
  var value = TextEditingController();

  Future<void> Auctionlist() async {
    try {
      loading1(true);
      final shared = await SharedPreferences.getInstance();
      String? user = shared.getString(userid);

      // final get = Get.put(loginController(context: context));

      if (user != null) {
        auctionlist.clear();
        var authres = await Apiservice().afterloginauctionlist();
        Response2(authres);
        auth(true);
        var map = authres.responseData?.responseMap!.mapList;
        auctionlist.clear();
        for (var so in map!) {
          auctionlist.add(so);
        }
        print("authres");
      } else {
        auctionlist.clear();
        auth(false);
        var unauthres = await Apiservice().unauthauctionlist();
        Response1(unauthres);
        var map = unauthres.responseData?.responseMap!.mapList;
        auctionlist.clear();
        if (unauthres.responseData == null) {
          Get.toNamed("/login");
        }
        for (var so in map!) {
          auctionlist.add(so);
        }

        print("unauthres");
      }
    } finally {
      loading1(false);
    }
  }

  Future<void> AuctionDetail(String auctionId, String clientId) async {
    try {
      loading2(true);

      final res = await Apiservice().auctiondetail(clientId, auctionId);
      if (res.statusCode == 200) {
        Response3(res);
        auctionid.value = res.responseData!.auctionId.toString();
      }
    } finally {
      loading2(false);
    }
  }

  Future<void> TermsconDitions(String auctionId, String isitemselection) async {
    try {
      loading3(true);
      final shared = await SharedPreferences.getInstance();

      String tokens = shared.getString(token) ?? '';
      String trackLoginid = shared.getString(trackLoginId) ?? '';
      String clientId = shared.getString(clienid) ?? '';
      String bidder = shared.getString(bidderid) ?? '';
      String usertypeId = shared.getString(bidderid) ??
          ''; // Assuming a typo, should this be different?

      final response = await http.get(
        Uri.parse(
            "${Strings.url}eauctionbid/aucbidconform/getClientBidTermId/$clientId/$auctionId/1"),
        headers: {
          'Content-type': 'application/json',
          'trackLoginId': trackLoginid,
          'Authorization': 'Bearer $tokens',
          'Userid': bidder,
          'Usertypeid': usertypeId,
          'clientId': clientId,
        },
      );

      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        print('Full response body: $body');

        if (body['responseData'] != null &&
            body['responseData']['responseData'] != null) {
          var responseDataList = body['responseData']['responseData'];
          if (responseDataList is List && responseDataList.isNotEmpty) {
            var firstItem = responseDataList[0];
            if (firstItem['bidTerm'] != null) {
              print(firstItem['bidTerm']);
              Get.toNamed("/termsconditions",
                  arguments: {'bidTerm': firstItem['bidTerm']});

              shared.setString(isitemselec, isitemselection.toString());
              shared.setString(auctionid.value, auctionId.toString());

              shared.setString(
                  clientBidTermid, firstItem['clientBidTermId'].toString());
              bidTerm = firstItem['bidTerm'].toString() as RxString;

              return firstItem['bidTerm'];
            } else {
              throw "bidTerm not found in the first item of responseData";
            }
          } else {
            throw "responseData is not a list or is empty";
          }
        } else {
          throw "responseData not found in response";
        }
      } else {
        throw "Some thing went wrong: ${response.statusCode}";
      }
    } catch (e) {
      print(e);
    } finally {
      print("auctionid" + auctionid.toString());
      print("clientBidTermid" + clientBidTermid.toString());
      print("isitemselec" + isitemselec.toString());
      loading3(false);
    }
  }

  Future<void> Termsauctioniagree() async {
    try {
      loading4(true);
      final shared = await SharedPreferences.getInstance();
      final get = Get.put(homeController(context: context));
      String Isitemselec = shared.getString(isitemselec) ?? '';
      String auctiId = shared.getString(auctionid.value) ?? '';
      String clientBidTermId = shared.getString(clientBidTermid) ?? '';
      print("Isitemselec" + Isitemselec);
      print("auctionId" + auctiId);
      print("clientBidTermId" + clientBidTermId);
      final res = await Apiservice()
          .termsconditions(auctiId, clientBidTermId, Isitemselec);

      if (res.statusCode == 200 || res.statusCode == 500) {
        Response4(res);
        print("200");
        toast(res.message.toString());
        print(res.message.toString());
        if (res.message.toString() == "Term & Condition fail") {
        } else {
          get.AuctionDetail(auctiId.toString(), "1");
          Get.toNamed("/details");
        }
      } else {
        print(res.statusCode);
      }
    } catch (e) {
      print(e);
    } finally {
      loading4(false);
    }
  }

  Future<void> GetitemSelection(String auctionId) async {
    if (isLoading) return; // Prevent multiple simultaneous API calls
    try {
      isLoading = true;
      loading5(true);
      print("page ${currentPage.value}");

      final initialRes =
          await Apiservice().getitemselection(auctionId, 20, currentPage.value);

      if (initialRes.statusCode == 200) {
        Response5(initialRes);
        print("total no. records: ${initialRes.responseData?.totalNoRecords}");

        double totalRecords =
            initialRes.responseData?.totalNoRecords?.toDouble() ?? 0.0;
        double totalPages = (totalRecords / 20.0).ceil().toDouble();

        currentPage.value = 0;
        headerlist.clear();
        cellvaluelist.clear();
        headerlist.add("a");

        items.value = initialRes.responseData?.totalNoRecords ?? 0;
        objectid.value =
            initialRes.responseData?.cellListData?[0].tableId?.toString() ?? "";

        var header = initialRes.responseData?.headerListData;
        if (header != null) {
          for (var h in header) {
            headerlist.add(h.columnheader ?? "");
          }
        }

        var value = initialRes.responseData?.cellListData;
        if (value != null) {
          for (var v in value) {
            List<String> temp = [v.isActive.toString()];
            temp.addAll(v.cellvaluelist
                    ?.map((cell) => cell.itemValue?.toString() ?? "")
                    .toList() ??
                []);
            cellvaluelist.add(temp);
          }
        }

        print("header list: $headerlist");
        print("value list: $cellvaluelist");

        currentPage.value++;
        pagecount.value++;

        // Fetch remaining pages
        while (currentPage.value < totalPages) {
          final res = await Apiservice()
              .getitemselection(auctionId, 20, currentPage.value);

          if (res.statusCode == 200) {
            var value = res.responseData?.cellListData;
            if (value != null) {
              for (var v in value) {
                List<String> temp = [v.isActive.toString()];
                temp.addAll(v.cellvaluelist
                        ?.map((cell) => cell.itemValue?.toString() ?? "")
                        .toList() ??
                    []);
                cellvaluelist.add(temp);
              }
            }

            print("Fetching page ${currentPage.value}");
            currentPage.value++;
          } else {
            print(
                "Failed to load data for page ${currentPage.value}: ${res.statusCode}");
            break;
          }
        }
      } else {
        print("Failed to load initial data: ${initialRes.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      loading5(false);
      isLoading = false;
    }
  }

  Future<void> itemSelectionsubmit() async {
    try {
      loading7(true);
      loding(context);
      final shared = await SharedPreferences.getInstance();
      String tokens = shared.getString(token).toString();

      final get = Get.put(wedsocket(
          context: context, token: tokens, autionid: auctionid.value));
      get.connect();
      itemsubmit.clear();
      itemselectioncount.value = 0;
      for (var i = 0; i < cellvaluelist.length; i++) {
        Map<String, int> temp = {};
        if (cellvaluelist[i][0] == "1") {
          temp["rowId"] = Response5.value.responseData!.cellListData![i].rowId!;
          temp["checkedItems"] = cellvaluelist[i][0] == "1" ? 1 : 0;
          temp["mapItemBidderId"] =
              Response5.value.responseData!.cellListData![i].mapitembidderid!;
        }

        if (cellvaluelist[i][0] == "1") {
          itemselectioncount++;
        }
        itemsubmit.add(temp);
      }
      print("itemselectioncount" + itemselectioncount.toString());

      final res = await Apiservice()
          .itemselectionsubmit(objectid.value, auctionid.value, itemsubmit);
      if (res.statusCode == 200) {
        Response7(res);
        print("itemselectioncount" + itemselectioncount.toString());
        print(itemsubmit);
        // headerlist.clear();
        // cellvaluelist.clear();
      }
    } catch (e) {
      print(e);
    } finally {
      loading7(false);
    }
  }

  Future<void> Dynbiddinghall(String page) async {
    try {
      loading6(true);

      final res = await Apiservice().dynbiddinghall(auctionid.value);

      if (res.statusCode == 200) {
        Response6(res);
        print("Dynbiddinghall call");
        if (res.responseData!.biddingHallDetail![0].isauctionarchive == true) {
          Auctionlist();
          Get.toNamed("/home");
        }
      } else {
        print(res.statusCode);
      }
    } catch (e) {
      print(e);
    } finally {
      // if (page == "item") {
      //   Get.toNamed("/manualbidding");
      // }

      loading6(false);
    }
  }

  Future<void> Dynbiddinghallauto(String page) async {
    try {
      loading11(true);
      final res = await Apiservice().dynbiddinghall(auctionid.value);
      if (res.statusCode == 200) {
        Response11(res);
        print("Dynbiddinghallauto");
        if (res.responseData!.biddingHallDetail![0].isauctionarchive == true) {
          Auctionlist();
          Get.toNamed("/home");
        }
        // toast(res.message.toString());
      } else {
        print(res.statusCode);
      }
    } catch (e) {
      print(e);
    } finally {
      loading11(false);
    }
  }

  Future<void> Bidsubmit(tableid, rowid, bidprice, qtybidprice, totalRatecellId,
      totalRatecellValue) async {
    try {
      loading8(true);
      print("auctionid" + auctionid.value);
      print("userid" + "33");
      final shared = await SharedPreferences.getInstance();
      String tokens = shared.getString(token).toString();

      final res = await Apiservice().bidsubmit(auctionid.value, tableid, rowid,
          bidprice, qtybidprice, totalRatecellId, totalRatecellValue);
      final get = Get.put(wedsocket(
          context: context, token: tokens, autionid: auctionid.value));

      if (res.statusCode == 200) {
        Response8(res);
        if (autobiddingstates.value) {
          voice("your rank is 1 ");
        }
        toast(res.message.toString());
        get.sendMessage(auctionid.value);
      } else {
        toast(res.message.toString());
        print(res.statusCode);
      }
    } catch (e) {
      print(e);
    } finally {
      // Dynbiddinghall("");

      loading8(false);
    }
  }

  Future<void> Bidlog(state) async {
    try {
      loading10(true);

      final res = await Apiservice().bidlog(auctionid.value, state);

      Response10(res);

      print("dsibfubjs" + res.responseData!.bidHisList.length.toString());
      // auctionColumnHeader.clear();
      // for (var i = 0;
      // i < res.responseData!.auctionColumnHeader!.length;
      // i++) {
      //   auctionColumnHeader.add(res
      //       .responseData!.auctionColumnHeader![i].columnheader
      //       .toString());
      // }
      //
      // print(auctionColumnHeader);
      // toast(res.message.toString());
    } catch (e) {
      print(e);
    } finally {
      loading10(false);
    }
  }

  Future voice(String string) async {
    if (voicestates.value) {
      final FlutterTts flutterTts = FlutterTts();
      await flutterTts.setLanguage("en-US");
      await flutterTts.setPitch(1.0);
      await flutterTts.speak(string);
    }
  }

  Future<void> autobidding() async {
    print("autobidding on");
    loading12.value = true;

    // Calculate indices once
    final auctionColumnHeader =
        Response11.value.responseData!.auctionColumnHeader!;
    qunindex =
        auctionColumnHeader.indexWhere((element) => element.columntypeid == 2);
    yourrankindex = auctionColumnHeader
        .indexWhere((element) => element.columntypeid == 10005);
    nextpossindex = auctionColumnHeader
        .indexWhere((element) => element.columntypeid == 10003);
    startindex = auctionColumnHeader
        .indexWhere((element) => element.columntypeid == 10001);
    incrementindex = auctionColumnHeader
        .indexWhere((element) => element.columntypeid == 10007);
    h1bidindex = auctionColumnHeader
        .indexWhere((element) => element.columntypeid == 10002);
    totalrateindex =
        auctionColumnHeader.indexWhere((element) => element.columntypeid == 5);

    // Fetch the necessary details once
    final biddingHallDetail =
        Response11.value.responseData!.biddingHallDetail![0];
    final auctionCellValueList = biddingHallDetail.auctionCellValueList!;
    final detail = Response11.value.responseData!.biddingHallDetail![0];

    // Fetching required cell values once
    String table = auctionCellValueList[0].tableid.toString();
    String row = auctionCellValueList[0].rowid.toString();
    String trci = auctionCellValueList[totalrateindex].cellid.toString();
    String totalRatecellValue =
        auctionCellValueList[totalrateindex].cellvalue.toString();
    DateTime endDate = DateFormat("dd/MM/yyyy HH:mm:ss")
        .parse(biddingHallDetail.enddate.toString());

    // Parsing required cell values
    double cellValue1 =
        double.parse(auctionCellValueList[qunindex].cellvalue.toString());
    double cellValue5 =
        double.parse(auctionCellValueList[h1bidindex].cellvalue.toString());
    double cellValue7 =
        double.parse(auctionCellValueList[incrementindex].cellvalue.toString());
    double cellValue3 =
        double.parse(auctionCellValueList[startindex].cellvalue.toString());

    // Get the current date without time
    DateTime currentDate = DateTime.now();
    currentDate =
        DateTime(currentDate.year, currentDate.month, currentDate.day);

    // Calculate the difference in days
    Duration difference = endDate.difference(currentDate);

    bool nextFilledBy =
        auctionColumnHeader[nextpossindex].filledby.toString() == "1";
    bool firstBidCond = detail.firstbidcond.toString() == "1";
    bool eventTypeIsOne = detail.eventtypeid.toString() == "1";

    String Next = nextFilledBy
        ? auctionCellValueList[nextpossindex].cellvalue.toString()
        : eventTypeIsOne
            ? cellValue5 > 0.00
                ? (cellValue5 + cellValue7).toString()
                : firstBidCond
                    ? cellValue3.toString()
                    : (cellValue3 + cellValue7).toString()
            : cellValue5 > 0.00
                ? (cellValue5 - cellValue7).toString()
                : firstBidCond
                    ? cellValue3.toString()
                    : (cellValue3 - cellValue7).toString();

    String Total = nextFilledBy
        ? auctionCellValueList[nextpossindex].cellvalue.toString()
        : eventTypeIsOne
            ? cellValue5 > 0.00
                ? ((cellValue5 + cellValue7) * cellValue1).toString()
                : firstBidCond
                    ? (cellValue3 * cellValue1).toString()
                    : ((cellValue3 + cellValue7) * cellValue1).toString()
            : cellValue5 > 0.00
                ? ((cellValue5 - cellValue7) * cellValue1).toString()
                : firstBidCond
                    ? (cellValue3 * cellValue1).toString()
                    : ((cellValue3 - cellValue7) * cellValue1).toString();

    print("next" + Next);
    print("total" + Total);

    if (difference != Duration.zero) {
      print("difference  " + difference.toString());

      if (auctionCellValueList[yourrankindex].cellvalue.toString() != "1") {
        double nextValue = double.parse(Next);
        double inputValue = double.parse(value.text);

        if (eventTypeIsOne ? inputValue > nextValue : inputValue < nextValue) {
          print("bidsubmit");

          await Bidsubmit(table, row, Next, Total, trci, totalRatecellValue);
          if (eventTypeIsOne
              ? inputValue - nextValue < 100
              : nextValue - inputValue == 100) {
            toast("100");
          }
        } else {
          autobiddingstates.value = false;
          final get1 = Get.put(TimerController(context: context));
          get1.countdownTimer?.cancel();
          showMyDialog();
          voice(eventTypeIsOne
              ? "increase your limit value"
              : "decrease your limit value");
          // await flutterTts.speak(eventTypeIsOne
          //     ? "increase your limit value"
          //     : "decrease your limit value");
        }
      }
    }

    print("autobidding com");
    loading12.value = false;
  }

  Future<void> showMyDialog() {
    final get = Get.put(TimerController(context: context));
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            width: widths * 0.8,
            height: 200,
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    sbh(10.0),
                    const Text(
                      "Auto Bidding",
                      style: TextStyle(
                          color: colors.primary,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    sbh(10.0),
                    SizedBox(
                      width: widths * 0.6,
                      child: Text(
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 16),
                          "Set your ${Response3.value.responseData?.eventTypeId == 1 ? "Higest" : "Lowest"} Bid Limit"),
                    ),
                    sbh(20.0),
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
                        controller: value,
                        cursorColor: colors.primary,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Ex. 21000",
                        ),
                      ),
                    ),
                    sbh(20.0),
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
                              autobiddingstates.value = true;
                              voicestates.value = true;

                              if (autobiddingstates.value == true) {
                                get.performTask();
                              }
                              if (autobiddingstates.value == false) {
                                get.countdownTimer?.cancel();
                              }
                              Navigator.pop(context, false);
                            }
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Start Auto Bidding",
                                style: TextStyle(color: colors.primary),
                              ),
                              Icon(Icons.arrow_right_alt, color: colors.primary)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> getupdo(String auction) async {
    try {
      loading13(true);

      final res = await Apiservice().getupdocs(auction);

      Response12(res);
      // if (Response12.value.responseData != null) {
      //   for (var i = 0;
      //       i < Response12.value.responseData!.documentDetailsDTOS!.length;
      //       i++) {
      //     getupdocslist.add(Response12
      //         .value.responseData!.documentDetailsDTOS![i].docName
      //         .toString());
      //   }
      // }

      print("dsibfubjs" +
          Response12.value.responseData!.documentDetailsDTOS![0].docName
              .toString());
    } catch (e) {
      print(e);
    } finally {
      loading13(false);
    }
  }

  Future<void> downloads(String auction) async {
    try {
      loading14(true);

      if (Response12.value.responseData!.documentDetailsDTOS!.isNotEmpty) {
        for (var i = 0;
            i < Response12.value.responseData!.documentDetailsDTOS!.length;
            i++) {
          print("fiusdi" +
              Response12.value.responseData!.documentDetailsDTOS![i]
                  .officerDocMappingId
                  .toString());
          final res = await Apiservice().downloadfiles(Response12
              .value.responseData!.documentDetailsDTOS![i].officerDocMappingId
              .toString());
          Response13(res);
          String? base64String =
              res.responseData?.fileContent; // Your base64 string from API
          Uint8List bytes = base64.decode(base64String!);

          await savePngFile(bytes, res.responseData!.fileName);
        }
      } else {
        toast("documents not available");
      }
    } catch (e) {
      print(e);
    } finally {
      loading14(false);
    }
  }

  Future<void> savePngFile(Uint8List bytes, String? filename) async {
    // final directory = await getApplicationDocumentsDirectory();
    String? filep = filename?.replaceAll(" ", "");
    final filePath = '/storage/emulated/0/Download/$filep';
    final file = File(filePath);
    await file.writeAsBytes(bytes);

    toast(filep!);
    print('file has been created successfully at $filep');
  }

  Future<void> viewbiddierlinks() async {
    try {
      loading15(true);

      final res = await Apiservice().viewlinks("1193");

      Response14(res);
      //print(Response14.value.responseData?.linkLists![0].linkName);
    } catch (e) {
      //print(e);
    } finally {
      loading15(false);
    }
  }

  @override
  void onInit() {
    Auctionlist();
    // scrollController1.value.addListener(scroll);
    final get1 = Get.put(profileController(context: context));
    get1.getprofile();

    super.onInit();
  }

  @override
  void dispose() async {
    scrollController1.value.dispose();
    super.dispose();
  }
}
// Future<void> Bidsubmitall(tableid, rowid, bidprice, qtybidprice) async {
//   try {
//     loading9(true);
//
//     final res = await Apiservice()
//         .bidsubmit(auctionid, userid, tableid, rowid, bidprice, qtybidprice);
//
//     if (res.statusCode == 200) {
//       // Response9(res);
//       // auctionColumnHeader.clear();
//       // for (var i = 0;
//       // i < res.responseData!.auctionColumnHeader!.length;
//       // i++) {
//       //   auctionColumnHeader.add(res
//       //       .responseData!.auctionColumnHeader![i].columnheader
//       //       .toString());
//       // }
//       //
//       // print(auctionColumnHeader);
//       // toast(res.message.toString());
//     } else {
//       print(res.statusCode);
//     }
//   } catch (e) {
//     print(e);
//   } finally {
//     loading9(false);
//   }
// }

// Future<void> GetitemSelection(String auctionId) async {
//   if (isLoading) return; // Prevent multiple simultaneous API calls
//   try {
//     isLoading = true;
//     loading5(true);
//     print("page" + currentPage.value.toString());
//     final res = await Apiservice()
//         .getitemselection(auctionId, items.value, currentPage.value);
//
//     if (res.statusCode == 200) {
//       Response5(res);
//       print("totalno" + res.responseData!.totalNoRecords.toString());
//       double page = double.parse(res.responseData!.totalNoRecords.toString());
//       double a = (page / 20.0);
//       print("A" + a.toString());
//       while (a > 0) {
//         if (currentPage.value == 0) {
//           headerlist.clear();
//           cellvaluelist.clear();
//           headerlist.add("a");
//
//           items.value = res.responseData?.totalNoRecords ?? 0;
//           objectid = res.responseData!.cellListData![0].tableId!.toString();
//
//           var header = res.responseData!.headerListData;
//           if (header != null) {
//             for (var h in header) {
//               headerlist.add(h.columnheader ?? "");
//             }
//           }
//         }
//
//         var value = res.responseData!.cellListData;
//         if (value != null) {
//           for (var v in value) {
//             List<String> temp = [v.isActive.toString()];
//             temp.addAll(v.cellvaluelist
//                     ?.map((cell) => cell.itemValue.toString() ?? "")
//                     .toList() ??
//                 []);
//             cellvaluelist.add(temp);
//           }
//         }
//
//         // Check if there are more items to load
//         if (res.responseData!.cellListData!.length < 20) {
//           // No more items to load
//           isLoading = false;
//         } else {
//           currentPage++;
//         }
//         a - 1;
//       }
//       print("totalno" + (a - 1).toString());
//       // if (currentPage.value == 0) {
//       //   headerlist.clear();
//       //   cellvaluelist.clear();
//       //   headerlist.add("a");
//       //
//       //   items.value = res.responseData?.totalNoRecords ?? 0;
//       //   objectid = res.responseData!.cellListData![0].tableId!.toString();
//       //
//       //   var header = res.responseData!.headerListData;
//       //   if (header != null) {
//       //     for (var h in header) {
//       //       headerlist.add(h.columnheader ?? "");
//       //     }
//       //   }
//       // }
//       //
//       // var value = res.responseData!.cellListData;
//       // if (value != null) {
//       //   for (var v in value) {
//       //     List<String> temp = [v.isActive.toString()];
//       //     temp.addAll(v.cellvaluelist
//       //             ?.map((cell) => cell.itemValue.toString() ?? "")
//       //             .toList() ??
//       //         []);
//       //     cellvaluelist.add(temp);
//       //   }
//       // }
//       //
//       // // Check if there are more items to load
//       // if (res.responseData!.cellListData!.length < 20) {
//       //   // No more items to load
//       //   isLoading = false;
//       // } else {
//       //   currentPage++;
//       // }
//       //
//       // print("header list$headerlist");
//       // print("value list$cellvaluelist");
//       //
//       // pagecount(pagecount.value + 1);
//       // print("page" + currentPage.value.toString());
//     }
//   } catch (e) {
//     print(e);
//   } finally {
//     loading5(false);
//     isLoading = false;
//   }
// }
// Future<void> autobidding() async {
//   print("autobidding on");
//   loading12.value = true;
//   // itemnameindex = Response11.value.responseData!.auctionColumnHeader!
//   //     .indexWhere((element) => element.columntypeid == 1);
//   qunindex = Response11.value.responseData!.auctionColumnHeader!
//       .indexWhere((element) => element.columntypeid == 2);
//   yourrankindex = Response11.value.responseData!.auctionColumnHeader!
//       .indexWhere((element) => element.columntypeid == 10005);
//   nextpossindex = Response11.value.responseData!.auctionColumnHeader!
//       .indexWhere((element) => element.columntypeid == 10003);
//   // lastbidindex = Response11.value.responseData!.auctionColumnHeader!
//   //     .indexWhere((element) => element.columntypeid == 10004);
//   startindex = Response11.value.responseData!.auctionColumnHeader!
//       .indexWhere((element) => element.columntypeid == 10001);
//   incrementindex = Response11.value.responseData!.auctionColumnHeader!
//       .indexWhere((element) => element.columntypeid == 10007);
//   h1bidindex = Response11.value.responseData!.auctionColumnHeader!
//       .indexWhere((element) => element.columntypeid == 10002);
//   totalrateindex = Response11.value.responseData!.auctionColumnHeader!
//       .indexWhere((element) => element.columntypeid == 5);
//
//   String table = Response11.value.responseData!.biddingHallDetail![0]
//       .auctionCellValueList![0].tableid
//       .toString();
//   String row = Response11.value.responseData!.biddingHallDetail![0]
//       .auctionCellValueList![0].rowid
//       .toString();
//   String trci = Response11.value.responseData!.biddingHallDetail![0]
//       .auctionCellValueList![totalrateindex].cellid
//       .toString();
//   String totalRatecellValue = Response11.value.responseData!
//       .biddingHallDetail![0].auctionCellValueList![totalrateindex].cellvalue
//       .toString();
//   DateTime endDate = DateFormat("dd/MM/yyyy HH:mm:ss").parse(Response11
//       .value.responseData!.biddingHallDetail![0].enddate
//       .toString());
//   final detail = Response11.value.responseData!.biddingHallDetail![0];
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
//   // Get the current date (without time)
//   DateTime currentDate = DateTime.now();
//   currentDate =
//       DateTime(currentDate.year, currentDate.month, currentDate.day);
//
//   // Calculate the difference in days
//   Duration difference = endDate.difference(currentDate);
//
//   String Next = Response11.value.responseData!
//               .auctionColumnHeader![nextpossindex].filledby
//               .toString() ==
//           "1"
//       ? Response11.value.responseData!.biddingHallDetail![0]
//           .auctionCellValueList![nextpossindex].cellvalue
//           .toString()
//       : Response11.value.responseData!.biddingHallDetail![0].eventtypeid
//                   .toString() ==
//               "1"
//           ? cellValue5 > 0.00
//               ? (cellValue5 + cellValue7).toString()
//               : detail.firstbidcond.toString() == "1"
//                   ? cellValue3.toString()
//                   : (cellValue3 + cellValue7).toString()
//           : cellValue5 > 0.00
//               ? (cellValue5 - cellValue7).toString()
//               : detail.firstbidcond.toString() == "1"
//                   ? cellValue3.toString()
//                   : (cellValue3 - cellValue7).toString();
//   String Total = Response11.value.responseData!
//               .auctionColumnHeader![nextpossindex].filledby
//               .toString() ==
//           "1"
//       ? Response11.value.responseData!.biddingHallDetail![0]
//           .auctionCellValueList![nextpossindex].cellvalue
//           .toString()
//       : Response11.value.responseData!.biddingHallDetail![0].eventtypeid
//                   .toString() ==
//               "1"
//           ? cellValue5 > 0.00
//               ? ((cellValue5 + cellValue7) * cellValue1).toString()
//               : detail.firstbidcond.toString() == "1"
//                   ? (cellValue3 * cellValue1).toString()
//                   : ((cellValue3 + cellValue7) * cellValue1).toString()
//           : cellValue5 > 0.00
//               ? ((cellValue5 - cellValue7) * cellValue1).toString()
//               : detail.firstbidcond.toString() == "1"
//                   ? (cellValue3 * cellValue1).toString()
//                   : ((cellValue3 - cellValue7) * cellValue1).toString();
//
//   print("next" + Next);
//   print("total" + Total);
//
//   final FlutterTts flutterTts = FlutterTts();
//   await flutterTts.setLanguage("en-US");
//   await flutterTts.setPitch(1.0);
//   // await flutterTts.speak(get
//   //     .Response6
//   //     .value
//   //     .responseData!
//   //     .biddingHallDetail![widget.index]
//   //     .auctionCellValueList![h1bidindex]
//   //     .cellvalue
//   //     .toString())
//
//   if (difference.toString() != "00:00:00.000000") {
//     print("difference  " + difference.toString());
//
//     if (Response11.value.responseData!.biddingHallDetail![0]
//             .auctionCellValueList![yourrankindex].cellvalue
//             .toString() !=
//         "1") {
//       if (Response11.value.responseData!.biddingHallDetail![0].eventtypeid
//               .toString() ==
//           "1") {
//         // ++++
//         if (double.parse(value.text) > double.parse(Next)) {
//           print("bidsubmit");
//           await Bidsubmit(table, row, Next, Total, trci, totalRatecellValue);
//           //
//           // if (Response8.value.responseData?.validBidFlag.toString() != "1") {
//           //   print("validBidFlag" +
//           //       Response8.value.responseData!.validBidFlag.toString());
//           // } else {
//           //   Dynbiddinghallauto("");
//           // }
//         } else {
//           autobiddingstates = false;
//           final get1 = Get.put(TimerController(context: context));
//           get1.countdownTimer?.cancel();
//           final FlutterTts flutterTts = FlutterTts();
//           await flutterTts.setLanguage("en-US");
//           await flutterTts.setPitch(1.0);
//           await flutterTts.speak("increase your limit value");
//         }
//       } else {
//         //-----
//         if (double.parse(value.text) < double.parse(Next)) {
//           print("bidsubmit");
//           await Bidsubmit(table, row, Next, Total, trci, totalRatecellValue);
//
//           // if (Response8.value.responseData?.validBidFlag.toString() != "1") {
//           //   print("validBidFlag");
//           // } else {
//           //   Dynbiddinghallauto("");
//           // }
//         } else {
//           autobiddingstates = false;
//           final get1 = Get.put(TimerController(context: context));
//           get1.countdownTimer?.cancel();
//           final FlutterTts flutterTts = FlutterTts();
//           await flutterTts.setLanguage("en-US");
//           await flutterTts.setPitch(1.0);
//           await flutterTts.speak("decrease your limit value");
//         }
//       }
//     } else {}
//   }
//
//   print("autobidding com");
//
//   loading12.value = false;
// }
