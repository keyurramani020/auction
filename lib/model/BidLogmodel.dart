class Bidlogmodel {
  String? message;
  int? statusCode;
  ResponseData? responseData;

  Bidlogmodel({
    this.message,
    this.statusCode,
    this.responseData,
  });

  factory Bidlogmodel.fromJson(Map<String, dynamic> json) {
    return Bidlogmodel(
      message: json['message'],
      statusCode: json['statusCode'],
      responseData: ResponseData.fromJson(json['responseData']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'statusCode': statusCode,
      'responseData': responseData?.toJson(),
    };
  }
}

class ResponseData {
  int decimalValue;
  List<BidHistory> bidHisList;

  ResponseData({
    required this.decimalValue,
    required this.bidHisList,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    return ResponseData(
      decimalValue: json['decimalValue'],
      bidHisList: List<BidHistory>.from(
        json['bidHisList'].map((bid) => BidHistory.fromJson(bid)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'decimalValue': decimalValue,
      'bidHisList': bidHisList.map((bid) => bid.toJson()).toList(),
    };
  }
}

class BidHistory {
  int rowid;
  String itemname;
  double bidprice;
  String bidtime;
  String ipaddress;
  int rejectstatus;
  int isapproved;
  String remark;
  int isautobid;
  int bidderid;
  int isproxybid;
  String bidderbidprice;
  String companyname;
  String emailid;
  dynamic biddercurrency;
  int bidid;

  BidHistory({
    required this.rowid,
    required this.itemname,
    required this.bidprice,
    required this.bidtime,
    required this.ipaddress,
    required this.rejectstatus,
    required this.isapproved,
    required this.remark,
    required this.isautobid,
    required this.bidderid,
    required this.isproxybid,
    required this.bidderbidprice,
    required this.companyname,
    required this.emailid,
    this.biddercurrency,
    required this.bidid,
  });

  factory BidHistory.fromJson(Map<String, dynamic> json) {
    return BidHistory(
      rowid: json['rowid'],
      itemname: json['itemname'],
      bidprice: json['bidprice'],
      bidtime: json['bidtime'],
      ipaddress: json['ipaddress'],
      rejectstatus: json['rejectstatus'],
      isapproved: json['isapproved'],
      remark: json['remark'],
      isautobid: json['isautobid'],
      bidderid: json['bidderid'],
      isproxybid: json['isproxybid'],
      bidderbidprice: json['bidderbidprice'],
      companyname: json['companyname'],
      emailid: json['emailid'],
      biddercurrency: json['biddercurrency'],
      bidid: json['bidid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rowid': rowid,
      'itemname': itemname,
      'bidprice': bidprice,
      'bidtime': bidtime,
      'ipaddress': ipaddress,
      'rejectstatus': rejectstatus,
      'isapproved': isapproved,
      'remark': remark,
      'isautobid': isautobid,
      'bidderid': bidderid,
      'isproxybid': isproxybid,
      'bidderbidprice': bidderbidprice,
      'companyname': companyname,
      'emailid': emailid,
      'biddercurrency': biddercurrency,
      'bidid': bidid,
    };
  }
}
