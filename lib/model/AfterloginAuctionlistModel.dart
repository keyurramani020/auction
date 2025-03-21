class AfterLoginAuctionlistModel {
  String? message;
  int? statusCode;
  ResponseData? responseData;

  AfterLoginAuctionlistModel(
      {this.message, this.statusCode, this.responseData});

  AfterLoginAuctionlistModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    responseData = json['responseData'] != null
        ? new ResponseData.fromJson(json['responseData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['statusCode'] = this.statusCode;
    if (this.responseData != null) {
      data['responseData'] = this.responseData!.toJson();
    }
    return data;
  }
}

class ResponseData {
  ResponseMap? responseMap;
  int? totalRecords;

  ResponseData({this.responseMap, this.totalRecords});

  ResponseData.fromJson(Map<String, dynamic> json) {
    responseMap = json['responseMap'] != null
        ? new ResponseMap.fromJson(json['responseMap'])
        : null;
    totalRecords = json['totalRecords'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.responseMap != null) {
      data['responseMap'] = this.responseMap!.toJson();
    }
    data['totalRecords'] = this.totalRecords;
    return data;
  }
}

class ResponseMap {
  List<MapList>? mapList;

  ResponseMap({this.mapList});

  ResponseMap.fromJson(Map<String, dynamic> json) {
    if (json['mapList'] != null) {
      mapList = <MapList>[];
      json['mapList'].forEach((v) {
        mapList!.add(new MapList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mapList != null) {
      data['mapList'] = this.mapList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MapList {
  int? rowno;
  int? auctionid;
  String? auctionno;
  int? isitemselection;
  String? auctionbrief;
  int? iseventwiseregretallowed;
  String? deptname;
  String? startdate;
  String? enddatevirtual;
  int? itembidderalreadyselected;
  String? eventtypeid;
  String? auctionmode;
  String? biddingtype;
  String? typeofauction;
  String? auctionstatus;
  int? clickherebid;
  int? manualbid;
  int? isautobidallowed;
  int? viewresult;
  int? clientid;
  int? auctionresult;
  int? fieldvalue18;
  int? fieldvalue21;
  int? fieldvalue22;
  int? feildvalue23;
  int? showhideaddremoveitems;
  int? fieldvalue25;
  int? fieldvalue27;
  int? fieldvalue28;
  int? fieldvalue29;
  int? fieldvalue30;
  int? fieldvalue31;

  MapList(
      {this.rowno,
      this.auctionid,
      this.auctionno,
      this.isitemselection,
      this.auctionbrief,
      this.iseventwiseregretallowed,
      this.deptname,
      this.startdate,
      this.enddatevirtual,
      this.itembidderalreadyselected,
      this.eventtypeid,
      this.auctionmode,
      this.biddingtype,
      this.typeofauction,
      this.auctionstatus,
      this.clickherebid,
      this.manualbid,
      this.isautobidallowed,
      this.viewresult,
      this.clientid,
      this.auctionresult,
      this.fieldvalue18,
      this.fieldvalue21,
      this.fieldvalue22,
      this.feildvalue23,
      this.showhideaddremoveitems,
      this.fieldvalue25,
      this.fieldvalue27,
      this.fieldvalue28,
      this.fieldvalue29,
      this.fieldvalue30,
      this.fieldvalue31});

  MapList.fromJson(Map<String, dynamic> json) {
    rowno = json['rowno'];
    auctionid = json['auctionid'];
    auctionno = json['auctionno'];
    isitemselection = json['isitemselection'];
    auctionbrief = json['auctionbrief'];
    iseventwiseregretallowed = json['iseventwiseregretallowed'];
    deptname = json['deptname'];
    startdate = json['startdate'];
    enddatevirtual = json['enddatevirtual'];
    itembidderalreadyselected = json['itembidderalreadyselected'];
    eventtypeid = json['eventtypeid'];
    auctionmode = json['auctionmode'];
    biddingtype = json['biddingtype'];
    typeofauction = json['typeofauction'];
    auctionstatus = json['auctionstatus'];
    clickherebid = json['clickherebid'];
    manualbid = json['manualbid'];
    isautobidallowed = json['isautobidallowed'];
    viewresult = json['viewresult'];
    clientid = json['clientid'];
    auctionresult = json['auctionresult'];
    fieldvalue18 = json['fieldvalue18'];
    fieldvalue21 = json['fieldvalue21'];
    fieldvalue22 = json['fieldvalue22'];
    feildvalue23 = json['feildvalue23'];
    showhideaddremoveitems = json['showhideaddremoveitems'];
    fieldvalue25 = json['fieldvalue25'];
    fieldvalue27 = json['fieldvalue27'];
    fieldvalue28 = json['fieldvalue28'];
    fieldvalue29 = json['fieldvalue29'];
    fieldvalue30 = json['fieldvalue30'];
    fieldvalue31 = json['fieldvalue31'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rowno'] = this.rowno;
    data['auctionid'] = this.auctionid;
    data['auctionno'] = this.auctionno;
    data['isitemselection'] = this.isitemselection;
    data['auctionbrief'] = this.auctionbrief;
    data['iseventwiseregretallowed'] = this.iseventwiseregretallowed;
    data['deptname'] = this.deptname;
    data['startdate'] = this.startdate;
    data['enddatevirtual'] = this.enddatevirtual;
    data['itembidderalreadyselected'] = this.itembidderalreadyselected;
    data['eventtypeid'] = this.eventtypeid;
    data['auctionmode'] = this.auctionmode;
    data['biddingtype'] = this.biddingtype;
    data['typeofauction'] = this.typeofauction;
    data['auctionstatus'] = this.auctionstatus;
    data['clickherebid'] = this.clickherebid;
    data['manualbid'] = this.manualbid;
    data['isautobidallowed'] = this.isautobidallowed;
    data['viewresult'] = this.viewresult;
    data['clientid'] = this.clientid;
    data['auctionresult'] = this.auctionresult;
    data['fieldvalue18'] = this.fieldvalue18;
    data['fieldvalue21'] = this.fieldvalue21;
    data['fieldvalue22'] = this.fieldvalue22;
    data['feildvalue23'] = this.feildvalue23;
    data['showhideaddremoveitems'] = this.showhideaddremoveitems;
    data['fieldvalue25'] = this.fieldvalue25;
    data['fieldvalue27'] = this.fieldvalue27;
    data['fieldvalue28'] = this.fieldvalue28;
    data['fieldvalue29'] = this.fieldvalue29;
    data['fieldvalue30'] = this.fieldvalue30;
    data['fieldvalue31'] = this.fieldvalue31;
    return data;
  }
}
