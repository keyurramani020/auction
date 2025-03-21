class UnauthAuctionlist {
  String? message;
  int? statusCode;
  ResponseData? responseData;

  UnauthAuctionlist({this.message, this.statusCode, this.responseData});

  UnauthAuctionlist.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    responseData = json['responseData'] != true
        ? ResponseData.fromJson(json['responseData'])
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
  String? auctionbrief;
  int? iseventwiseregretallowed;
  String? startdate;
  String? deptname;
  String? enddatevirtual;
  String? eventtypeid;
  String? auctiontype;
  String? auctionmode;
  String? auctionstatus;
  String? typeofauction;
  int? auctioneerid;
  int? fieldvalue31;

  MapList(
      {this.rowno,
      this.auctionid,
      this.auctionno,
      this.auctionbrief,
      this.iseventwiseregretallowed,
      this.startdate,
      this.deptname,
      this.enddatevirtual,
      this.eventtypeid,
      this.auctiontype,
      this.auctionmode,
      this.auctionstatus,
      this.typeofauction,
      this.auctioneerid,
      this.fieldvalue31});

  MapList.fromJson(Map<String, dynamic> json) {
    rowno = json['rowno'];
    auctionid = json['auctionid'];
    auctionno = json['auctionno'];
    auctionbrief = json['auctionbrief'];
    iseventwiseregretallowed = json['iseventwiseregretallowed'];
    startdate = json['startdate'];
    deptname = json['deptname'];
    enddatevirtual = json['enddatevirtual'];
    eventtypeid = json['eventtypeid'];
    auctiontype = json['auctiontype'];
    auctionmode = json['auctionmode'];
    auctionstatus = json['auctionstatus'];
    typeofauction = json['typeofauction'];
    auctioneerid = json['auctioneerid'];
    fieldvalue31 = json['fieldvalue31'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rowno'] = this.rowno;
    data['auctionid'] = this.auctionid;
    data['auctionno'] = this.auctionno;
    data['auctionbrief'] = this.auctionbrief;
    data['iseventwiseregretallowed'] = this.iseventwiseregretallowed;
    data['startdate'] = this.startdate;
    data['deptname'] = this.deptname;
    data['enddatevirtual'] = this.enddatevirtual;
    data['eventtypeid'] = this.eventtypeid;
    data['auctiontype'] = this.auctiontype;
    data['auctionmode'] = this.auctionmode;
    data['auctionstatus'] = this.auctionstatus;
    data['typeofauction'] = this.typeofauction;
    data['auctioneerid'] = this.auctioneerid;
    data['fieldvalue31'] = this.fieldvalue31;
    return data;
  }
}
