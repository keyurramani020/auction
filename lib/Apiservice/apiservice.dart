import 'dart:convert';
import 'dart:core';

import 'package:btt/View/Utilites/strings.dart';
import 'package:btt/View/Widget/widget.dart';
import 'package:btt/controller/logincontroller.dart';
import 'package:btt/model/AfterloginAuctionlistModel.dart';
import 'package:btt/model/AuctionDetailmodel.dart';
import 'package:btt/model/BidLogmodel.dart';
import 'package:btt/model/BidSubmitAllmodel.dart';
import 'package:btt/model/BidSubmitmodel.dart';
import 'package:btt/model/DynBiddingHallModel.dart';
import 'package:btt/model/GetBiddingHallModel.dart';
import 'package:btt/model/ItemBidderMapModel.dart';
import 'package:btt/model/Loginmodel.dart';
import 'package:btt/model/TermConditionsmodel.dart';
import 'package:btt/model/UnauthAuctionlist.dart';
import 'package:btt/model/ViewBiddermodel.dart';
import 'package:btt/model/changepasswordmodel.dart';
import 'package:btt/model/downloadfilemodel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:network_info_plus/network_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/GetItemSelectionmodel.dart';
import '../model/GetUploadedDocsModel.dart';
import '../model/viewbidlinksmodel.dart';

class Apiservice {
  get context => null;

  Future<LoginModel> login(String email, password) async {
    final response =
        await http.post(Uri.parse("${Strings.url}common/auth/token"),
            headers: {
              'Content-type': 'application/json',
            },
            body: jsonEncode(
              {
                "loginId": email,
                "loginIdError": "",
                "password": password,
                "passwordError": "",
                "clientId": "1",
                "isValidationSuccess": true
              },
            ));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data["statusCode"] == 200) {
        return LoginModel.fromJson(jsonDecode(response.body));
      } else {
        toast("Invalid User");
        throw "Some thing went wrong";
      }
    } else {
      toast("Invalid User");
      final get = Get.put(loginController(context: context!));
      get.logout();
      throw "Some thing went wrong";
    }
  }

  Future<changepassword> Changepassword(String oldpass, String newpass) async {
    final shared = await SharedPreferences.getInstance();

    String tokens = shared.getString(token).toString();
    String trackLoginid = shared.getString(trackLoginId).toString();
    String clientId = shared.getString(clienid).toString();
    String bidder = shared.getString(bidderid).toString();
    String email = shared.getString(emails).toString();
    print("clientid" + clientId);
    print("bidderid" + bidder);
    print("trackLoginid" + trackLoginid);
    final response = await http.post(
        Uri.parse("${Strings.url}common/admin/submitchangepassword"),
        headers: {
          'Content-type': 'application/json',
          'trackLoginId': trackLoginid,
          'Authorization': 'Bearer $tokens'
        },
        body: jsonEncode(
          {
            "sessionClientId": clientId,
            "userId": bidder,
            "loginId": email,
            "newPassword": newpass,
            "oldPassword": oldpass
          },
        ));
    print(response.toString());
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data["statusCode"] == 200) {
        return changepassword.fromJson(jsonDecode(response.body));
      } else {
        throw "Some thing went wrong";
      }
    } else {
      throw "Some thing went wrong";
    }
  }

  Future<UnauthAuctionlist> unauthauctionlist() async {
    // String macaddress = await GetMac.macAddress;

    final response = await http.get(
      Uri.parse("${Strings.url}eauction/unauth/auctionList/HomePage/1/1"),
      headers: {'Content-type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return UnauthAuctionlist.fromJson(jsonDecode(response.body));
    } else {
      Get.toNamed("/login");
      throw "Some thing went wrong";
    }
  }

  Future<AfterLoginAuctionlistModel> afterloginauctionlist() async {
    final shared = await SharedPreferences.getInstance();

    String tokens = shared.getString(token).toString();
    String trackLoginid = shared.getString(trackLoginId).toString();
    String clientId = shared.getString(clienid).toString();
    String bidder = shared.getString(bidderid).toString();
    print("clientid" + clientId);
    print("bidderid" + bidder);
    print("trackLoginid" + trackLoginid);
    final response = await http.post(
        Uri.parse("${Strings.url}eauction/auctioneer/auctionList/Bidder"),
        headers: {
          'Content-type': 'application/json',
          'trackLoginId': trackLoginid,
          'Authorization': 'Bearer $tokens'
        },
        body: jsonEncode(
          {"clientId": clientId, "bidderId": bidder, "flagId": 2},
        ));
    print(response.toString());
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data["statusCode"] == 200) {
        return AfterLoginAuctionlistModel.fromJson(jsonDecode(response.body));
      } else {
        throw "Some thing went wrong";
      }
    } else {
      final shared = await SharedPreferences.getInstance();
      shared.remove(userid);
      shared.remove(usertypeId);
      shared.remove(trackLoginId);
      shared.remove(token);
      Get.toNamed("/login");
      throw "Some thing went wrong";
    }
  }

  Future<AuctionDetailModel> auctiondetail(
      String clientid, String auctionId) async {
    final response = await http.get(
      Uri.parse(
          "${Strings.url}eauction/unauth/getAuction/${auctionId}/${clientid}"),
      headers: {'Content-type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return AuctionDetailModel.fromJson(jsonDecode(response.body));
    } else {
      throw "Some thing went wrong";
    }
  }

  Future<ViewBidder> bidderprofile() async {
    final shared = await SharedPreferences.getInstance();

    String tokens = shared.getString(token).toString();
    String trackLoginid = shared.getString(trackLoginId).toString();
    String clientId = shared.getString(clienid).toString();
    String bidder = shared.getString(bidderid).toString();
    final response = await http.get(
      Uri.parse("${Strings.url}common/bidder/viewBidder/$bidder"),
      headers: {
        'Content-type': 'application/json',
        'trackLoginId': trackLoginid,
        'Authorization': 'Bearer $tokens',
        'clientId': clientId,
      },
    );

    if (response.statusCode == 200) {
      return ViewBidder.fromJson(jsonDecode(response.body));
    } else {
      throw "Some thing went wrong";
    }
  }

  Future<TermConditionsModel> termsconditions(
      String auctionId, String clientBidTermid, String isitemselection) async {
    final shared = await SharedPreferences.getInstance();

    String tokens = shared.getString(token).toString();
    String trackLoginid = shared.getString(trackLoginId).toString();
    String clientId = shared.getString(clienid).toString();
    String bidder = shared.getString(bidderid).toString();

    final response = await http.post(
        Uri.parse(
            "${Strings.url}eauctionbid/aucbidconform/bidder/auctioniagree"),
        headers: {
          'Content-type': 'application/json',
          'trackLoginId': trackLoginid,
          'Authorization': 'Bearer $tokens',
          'Userid': bidder,
          'Usertypeid': usertypeId,
          'clientId': clientId,
        },
        body: jsonEncode({
          "auctionId": auctionId,
          "clientBidTermId": clientBidTermid,
          "userId": bidder,
          "bidderId": bidder,
          "clientId": clientId,
          "languageId": 1,
          "isitemselection": isitemselection,
          "itembidderalreadyselectedData": 0
        }));

    if (response.statusCode == 200) {
      return TermConditionsModel.fromJson(jsonDecode(response.body));
    } else {
      throw "Some thing went wrong";
    }
  }

  Future<GetBiddingHall> getbiddinghall(String auctionId) async {
    final shared = await SharedPreferences.getInstance();

    String tokens = shared.getString(token).toString();
    String trackLoginid = shared.getString(trackLoginId).toString();
    String clientId = shared.getString(clienid).toString();
    String bidder = shared.getString(bidderid).toString();

    final response = await http.post(
        Uri.parse("${Strings.url}eauctionbid/dynbiddinghall"),
        headers: {
          'Content-type': 'application/json',
          'trackLoginId': trackLoginid,
          'Authorization': 'Bearer $tokens',
          'Userid': bidder,
          'Usertypeid': usertypeId,
          'clientId': clientId,
        },
        body: jsonEncode(
            {"auctionId": auctionId, "userId": bidder, "clientId": clientId}));

    if (response.statusCode == 200) {
      return GetBiddingHall.fromJson(jsonDecode(response.body));
    } else {
      throw "Some thing went wrong";
    }
  }

  Future<GetItemSelection> getitemselection(
      String auctionId, int limit, int page) async {
    final shared = await SharedPreferences.getInstance();

    String tokens = shared.getString(token).toString();
    String trackLoginid = shared.getString(trackLoginId).toString();
    String clientId = shared.getString(clienid).toString();
    String bidder = shared.getString(bidderid).toString();
    print("page" + page.toString());
    final response = await http.post(
        Uri.parse("${Strings.url}eauctionbid/bidder/getitemselectionninecol"),
        headers: {
          'Content-type': 'application/json',
          'trackLoginId': trackLoginid,
          'Authorization': 'Bearer $tokens',
          'Userid': bidder,
          'Usertypeid': usertypeId,
          'clientId': clientId,
        },
        body: jsonEncode({
          "auctionId": auctionId,
          "bidderId": bidder,
          "clientId": clientId,
          "limit": limit,
          "page": page
        }));

    if (response.statusCode == 200) {
      return GetItemSelection.fromJson(jsonDecode(response.body));
    } else {
      throw "Some thing went wrong";
    }
  }

  Future<ItemBidderMap> itemselectionsubmit(
      String objectId, String auctionid, List submitlist) async {
    final shared = await SharedPreferences.getInstance();

    final tokens = shared.getString(token).toString();
    final trackLoginid = shared.getString(trackLoginId).toString();
    final clientId = shared.getString(clienid).toString();
    final bidder = shared.getString(bidderid).toString();
    print("auctionid:" + auctionid);
    print("objectId:" + objectId);

    final response =
        await http.post(Uri.parse("${Strings.url}eauctionbid/itembiddermap"),
            headers: {
              'Content-type': 'application/json',
              'trackLoginId': trackLoginid,
              'Authorization': 'Bearer $tokens',
              'Userid': bidder,
              'Usertypeid': usertypeId,
              'clientId': clientId,
            },
            body: jsonEncode({
              "eventId": auctionid,
              "bidderId": bidder,
              "bidExist": true,
              "fromWhere": 1,
              "linkId": 747,
              "objectId": objectId,
              "itemBidderMappingDtoList": submitlist
            }));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data["statusCode"] == 200) {
        print(data["message"]);
        return ItemBidderMap.fromJson(jsonDecode(response.body));
      } else {
        toast(data["message"]);
        print(data["message"]);
        throw "Some thing went wrong";
      }
    } else {
      toast("Invalid User");
      throw "Some thing went wrong";
    }
  }

  Future<DynBiddingHall> dynbiddinghall(String auid) async {
    final shared = await SharedPreferences.getInstance();

    String tokens = shared.getString(token).toString();
    String trackLoginid = shared.getString(trackLoginId).toString();
    String clientId = shared.getString(clienid).toString();
    String bidder = shared.getString(bidderid).toString();
    print("auction" + auid);

    final response =
        await http.post(Uri.parse("${Strings.url}eauctionbid/dynbiddinghall"),
            headers: {
              'Content-type': 'application/json',
              'trackLoginId': trackLoginid,
              'Authorization': 'Bearer $tokens',
              'Userid': bidder,
              'Usertypeid': usertypeId,
              'clientId': clientId,
            },
            body: jsonEncode({
              "auctionId": auid,
              "userId": bidder,
              "clientId": clientId,
            }));

    if (response.statusCode == 200) {
      return DynBiddingHall.fromJson(jsonDecode(response.body));
    } else {
      throw "Some thing went wrong";
    }
  }

  Future<BidSubmit> bidsubmit(String auctionId, TableId, RowId, BidPrice,
      QtyBidPrice, totalRatecellId, totalRatecellValue) async {
    final shared = await SharedPreferences.getInstance();

    String tokens = shared.getString(token).toString();
    String trackLoginid = shared.getString(trackLoginId).toString();
    String clientId = shared.getString(clienid).toString();
    String bidder = shared.getString(bidderid).toString();
    // var ipAddress = IpAddress(type: RequestType.json);
    // dynamic data = await ipAddress.getIpAddress();
    print("clientId" + clientId);
    final info = NetworkInfo();
    final wifiIP = await info.getWifiIP();

    /// Get the IpAddress based on requestType.

    final response =
        await http.post(Uri.parse("${Strings.url}eauctionbid/bidsubmit"),
            headers: {
              'Content-type': 'application/json',
              'trackLoginId': trackLoginid,
              'Authorization': 'Bearer $tokens',
              'Userid': bidder,
              'Usertypeid': usertypeId,
              'clientId': clientId,
            },
            body: jsonEncode({
              "auctionId": auctionId,
              "v_SessionUserId": bidder,
              "userid": bidder,
              "v_TableId": TableId,
              "v_RowId": RowId,
              "v_BidPrice": BidPrice,
              "v_IPAddress": wifiIP.toString(),
              "v_BidType": 0,
              "v_QtyBidPrice": 0,
              "v_CheckBidAmtStr": "",
              "v_OutputStr": "",
              "totalRateBidPrice": QtyBidPrice,
              "totalRatecellId": totalRatecellId,
              "totalRatecellValue": QtyBidPrice,
              "cellValue": 110,
              "cellId": totalRatecellId
            }));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data["statusCode"] == 200) {
        print(data["message"]);
        return BidSubmit.fromJson(jsonDecode(response.body));
      } else {
        // toast(data["message"].toString());
        print(data["message"]);
        throw "Some thing went wrong";
      }
    } else {
      throw "Some thing went wrong";
    }
  }

  Future<BidSubmitAll> bidsubmitall(bidsubmitAll) async {
    final shared = await SharedPreferences.getInstance();

    String tokens = shared.getString(token).toString();
    String trackLoginid = shared.getString(trackLoginId).toString();
    String clientId = shared.getString(clienid).toString();
    String bidder = shared.getString(bidderid).toString();

    final response =
        await http.post(Uri.parse("${Strings.url}eauctionbid/bidsubmitAll"),
            headers: {
              'Content-type': 'application/json',
              'trackLoginId': trackLoginid,
              'Authorization': 'Bearer $tokens',
              'Userid': bidder,
              'Usertypeid': usertypeId,
              'clientId': clientId,
            },
            body: jsonEncode(bidsubmitAll));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data["statusCode"] == 200) {
        print(data["message"]);
        return BidSubmitAll.fromJson(jsonDecode(response.body));
      } else {
        toast(data["message"]);
        print(data["message"]);
        throw "Some thing went wrong";
      }
    } else {
      throw "Some thing went wrong";
    }
  }

  Future<Bidlogmodel> bidlog(String aucid, String cstatus) async {
    final shared = await SharedPreferences.getInstance();

    String tokens = shared.getString(token).toString();
    String trackLoginid = shared.getString(trackLoginId).toString();
    String clientId = shared.getString(clienid).toString();
    String bidder = shared.getString(bidderid).toString();
    String userid = shared.getString(usertypeId).toString();

    final response = await http.post(
        Uri.parse("${Strings.url}eauctionbid/report/getBidHistoryReport"),
        headers: {
          'Content-type': 'application/json',
          'trackLoginId': trackLoginid,
          'Authorization': 'Bearer $tokens',
          'Userid': bidder,
          'Usertypeid': userid,
          'clientId': clientId,
        },
        body: jsonEncode({
          "auctionId": aucid,
          "bidderId": bidder,
          "userTypeId": userid,
          "clientId": clientId,
          "cstatus": cstatus,
          "rowId": 0
        }));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data["statusCode"] == 200) {
        print(data["message"]);
        print(data["responseData"]);
        return Bidlogmodel.fromJson(jsonDecode(response.body));
      } else {
        toast(data["message"]);
        print(data["message"]);
        throw "Some thing went wrong";
      }
    } else {
      throw "Some thing went wrong";
    }
  }

  Future<getuploadeddocs> getupdocs(String aucid) async {
    final shared = await SharedPreferences.getInstance();

    String tokens = shared.getString(token).toString();
    // String trackLoginid = shared.getString(trackLoginId).toString();
    String clientId = shared.getString(clienid).toString();
    // bidder = shared.getString(bidderid).toString();
    String userid = shared.getString(usertypeId).toString();

    final response = await http.post(
        Uri.parse("${Strings.url}eauction/fileupload/getuploadeddocs"),
        headers: {
          'Content-type': 'application/json',
          //'trackLoginId': trackLoginid,
          'Authorization': 'Bearer $tokens',
          // 'Userid': bidder,
          //'Usertypeid': userid,
          // 'clientId': clientId,
        },
        body: jsonEncode({
          "auctionId": aucid,
          "childId": 0,
          "clientId": clientId,
          "cstatus": -9,
          "linkId": 123,
          "mappedBy": 0,
          "objectId": aucid,
          "userId": userid,
          "userTypeId": "1"
        }));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data["statusCode"] == 200) {
        print(data["message"]);
        print(data["responseData"]);
        return getuploadeddocs.fromJson(jsonDecode(response.body));
      } else {
        toast(data["message"]);
        print(data["message"]);
        throw "Some thing went wrong";
      }
    } else {
      throw "Some thing went wrong";
    }
  }

  Future<downloadfile> downloadfiles(String docid) async {
    final shared = await SharedPreferences.getInstance();

    String tokens = shared.getString(token).toString();
    //String trackLoginid = shared.getString(trackLoginId).toString();
    String clientId = shared.getString(clienid).toString();
    String bidder = shared.getString(bidderid).toString();
    String userid = shared.getString(usertypeId).toString();

    final response = await http.post(
        Uri.parse(
            "https://neo.auctiontiger.net/NPDUAT/eauction/fileupload/ajax/downloadfile"),
        headers: {
          'Content-type': 'application/json',
          'Authorization': 'Bearer $tokens',
        },
        body: jsonEncode({
          "clientId": clientId,
          "userId": bidder,
          "userTypeId": userid,
          "docId": docid
        }));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data["statusCode"] == 200) {
        print(data["message"]);
        print(data["responseData"]);
        return downloadfile.fromJson(jsonDecode(response.body));
      } else {
        print(data["responseData"]);
        toast(data["message"]);
        print(data["message"]);
        throw "Some thing went wrong";
      }
    } else {
      throw "Some thing went wrong";
    }
  }

  Future<viewbiddinghalllinks> viewlinks(String auctionid) async {
    final shared = await SharedPreferences.getInstance();

    String tokens = shared.getString(token).toString();
    //String trackLoginid = shared.getString(trackLoginId).toString();
    String clientId = shared.getString(clienid).toString();
    String bidder = shared.getString(bidderid).toString();
    String userid = shared.getString(usertypeId).toString();

    final response = await http.get(
      Uri.parse(
          "${Strings.url}eauctionbid/unauth/viewbiddinghalllinks/${auctionid}/1"),
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $tokens',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data["statusCode"] == 200) {
        print(data["message"]);
        print(data["responseData"]);
        return viewbiddinghalllinks.fromJson(jsonDecode(response.body));
      } else {
        print(data["responseData"]);
        toast(data["message"]);
        print(data["message"]);
        throw "Some thing went wrong";
      }
    } else {
      throw "Some thing went wrong";
    }
  }
}
