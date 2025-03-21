class DynBiddingHall {
  String? message;
  int? statusCode;
  ResponseData? responseData;

  DynBiddingHall({this.message, this.statusCode, this.responseData});

  DynBiddingHall.fromJson(Map<String, dynamic> json) {
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
  List<BiddingHallDetail>? biddingHallDetail;
  List<AuctionCellValueList>? auctionTableValueList;
  int? govColNo;
  List<AuctionColumnHeader>? auctionColumnHeader;
  int? biddingHallItemSize;
  bool? isAuctionArchive;

  ResponseData(
      {this.biddingHallDetail,
      this.auctionTableValueList,
      this.govColNo,
      this.auctionColumnHeader,
      this.biddingHallItemSize,
      this.isAuctionArchive});

  ResponseData.fromJson(Map<String, dynamic> json) {
    if (json['biddingHallDetail'] != null) {
      biddingHallDetail = <BiddingHallDetail>[];
      json['biddingHallDetail'].forEach((v) {
        biddingHallDetail!.add(new BiddingHallDetail.fromJson(v));
      });
    }
    if (json['AuctionTableValueList'] != null) {
      auctionTableValueList = <AuctionCellValueList>[];
      json['AuctionTableValueList'].forEach((v) {
        auctionTableValueList!.add(new AuctionCellValueList.fromJson(v));
      });
    }
    govColNo = json['govColNo'];
    if (json['AuctionColumnHeader'] != null) {
      auctionColumnHeader = <AuctionColumnHeader>[];
      json['AuctionColumnHeader'].forEach((v) {
        auctionColumnHeader!.add(new AuctionColumnHeader.fromJson(v));
      });
    }
    biddingHallItemSize = json['biddingHallItemSize'];
    isAuctionArchive = json['isAuctionArchive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.biddingHallDetail != null) {
      data['biddingHallDetail'] =
          this.biddingHallDetail!.map((v) => v.toJson()).toList();
    }
    if (this.auctionTableValueList != null) {
      data['AuctionTableValueList'] =
          this.auctionTableValueList!.map((v) => v.toJson()).toList();
    }
    data['govColNo'] = this.govColNo;
    if (this.auctionColumnHeader != null) {
      data['AuctionColumnHeader'] =
          this.auctionColumnHeader!.map((v) => v.toJson()).toList();
    }
    data['biddingHallItemSize'] = this.biddingHallItemSize;
    data['isAuctionArchive'] = this.isAuctionArchive;
    return data;
  }
}

class BiddingHallDetail {
  int? isincdecinperiod;
  String? submittedon;
  int? isauctionrunnig;
  int? bidderid;
  int? bidid;
  String? bidderrank;
  double? exchangerate;
  int? isautoext;
  int? totalext;
  int? currentext;
  int? extmode;
  String? currencyname;
  double? incdecvalue;
  double? incdeconext;
  int? rowid;
  String? startdate;
  String? enddate;
  String? enddatevirtual;
  String? remainingtime;
  double? bidderstartprice;
  int? bidderh1l1price;
  double? bidderreserveprice;
  int? incdecper;
  double? bidderincdecvalue;
  int? isautobidrunning;
  String? basecurrencyname;
  int? bidderlastvalidbidamount;
  int? utcenddatevirtual;
  int? extendby;
  int? extendwhen;
  int? emdamount;
  int? emdbalance;
  double? minqty;
  int? bidpriceincdecintimes;
  int? isshowreservepricetobidder;
  int? checkreserveprice;
  int? noofbidallowed;
  int? eventtypeid;
  int? firstbidcond;
  int? isitemselection;
  int? auctionresult;
  int? incdecoptions;
  bool? isauctionarchive;
  int? isitemwisetime;
  int? configuretimeforitem;
  int? auctiontype;
  int? decimalvalueupto;
  int? isemdreq;
  String? formula;
  List<AuctionCellValueList>? auctionCellValueList;

  BiddingHallDetail({
    this.isincdecinperiod,
    this.submittedon,
    this.isauctionrunnig,
    this.bidderid,
    this.bidid,
    this.bidderrank,
    this.exchangerate,
    this.isautoext,
    this.totalext,
    this.currentext,
    this.extmode,
    this.currencyname,
    this.incdecvalue,
    this.incdeconext,
    this.rowid,
    this.startdate,
    this.enddate,
    this.enddatevirtual,
    this.remainingtime,
    this.bidderstartprice,
    this.bidderh1l1price,
    this.bidderreserveprice,
    this.incdecper,
    this.bidderincdecvalue,
    this.isautobidrunning,
    this.basecurrencyname,
    this.bidderlastvalidbidamount,
    this.utcenddatevirtual,
    this.extendby,
    this.extendwhen,
    this.emdamount,
    this.emdbalance,
    this.minqty,
    this.bidpriceincdecintimes,
    this.isshowreservepricetobidder,
    this.checkreserveprice,
    this.noofbidallowed,
    this.eventtypeid,
    this.firstbidcond,
    this.isitemselection,
    this.auctionresult,
    this.incdecoptions,
    this.isauctionarchive,
    this.isitemwisetime,
    this.configuretimeforitem,
    this.auctiontype,
    this.decimalvalueupto,
    this.isemdreq,
    this.formula,
    this.auctionCellValueList,
  });

  BiddingHallDetail.fromJson(Map<String, dynamic> json) {
    isincdecinperiod = _toInt(json['isincdecinperiod']);
    submittedon = json['submittedon'];
    isauctionrunnig = _toInt(json['isauctionrunnig']);
    bidderid = _toInt(json['bidderid']);
    bidid = _toInt(json['bidid']);
    bidderrank = json['bidderrank'];
    exchangerate = _toDouble(json['exchangerate']);
    isautoext = _toInt(json['isautoext']);
    totalext = _toInt(json['totalext']);
    currentext = _toInt(json['currentext']);
    extmode = _toInt(json['extmode']);
    currencyname = json['currencyname'];
    incdecvalue = _toDouble(json['incdecvalue']);
    incdeconext = _toDouble(json['incdeconext']);
    rowid = _toInt(json['rowid']);
    startdate = json['startdate'];
    enddate = json['enddate'];
    enddatevirtual = json['enddatevirtual'];
    remainingtime = json['remainingtime'];
    bidderstartprice = _toDouble(json['bidderstartprice']);
    bidderh1l1price = _toInt(json['bidderh1l1price']);
    bidderreserveprice = _toDouble(json['bidderreserveprice']);
    incdecper = _toInt(json['incdecper']);
    bidderincdecvalue = _toDouble(json['bidderincdecvalue']);
    isautobidrunning = _toInt(json['isautobidrunning']);
    basecurrencyname = json['basecurrencyname'];
    bidderlastvalidbidamount = _toInt(json['bidderlastvalidbidamount']);
    utcenddatevirtual = _toInt(json['utcenddatevirtual']);
    extendby = _toInt(json['extendby']);
    extendwhen = _toInt(json['extendwhen']);
    emdamount = _toInt(json['emdamount']);
    emdbalance = _toInt(json['emdbalance']);
    minqty = _toDouble(json['minqty']);
    bidpriceincdecintimes = _toInt(json['bidpriceincdecintimes']);
    isshowreservepricetobidder = _toInt(json['isshowreservepricetobidder']);
    checkreserveprice = _toInt(json['checkreserveprice']);
    noofbidallowed = _toInt(json['noofbidallowed']);
    eventtypeid = _toInt(json['eventtypeid']);
    firstbidcond = _toInt(json['firstbidcond']);
    isitemselection = _toInt(json['isitemselection']);
    auctionresult = _toInt(json['auctionresult']);
    incdecoptions = _toInt(json['incdecoptions']);
    isauctionarchive = json['isauctionarchive'];
    isitemwisetime = _toInt(json['isitemwisetime']);
    configuretimeforitem = _toInt(json['configuretimeforitem']);
    auctiontype = _toInt(json['auctiontype']);
    decimalvalueupto = _toInt(json['decimalvalueupto']);
    isemdreq = _toInt(json['isemdreq']);
    formula = json['formula'];
    if (json['AuctionCellValueList'] != null) {
      auctionCellValueList = <AuctionCellValueList>[];
      json['AuctionCellValueList'].forEach((v) {
        auctionCellValueList!.add(new AuctionCellValueList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isincdecinperiod'] = this.isincdecinperiod;
    data['submittedon'] = this.submittedon;
    data['isauctionrunnig'] = this.isauctionrunnig;
    data['bidderid'] = this.bidderid;
    data['bidid'] = this.bidid;
    data['bidderrank'] = this.bidderrank;
    data['exchangerate'] = this.exchangerate;
    data['isautoext'] = this.isautoext;
    data['totalext'] = this.totalext;
    data['currentext'] = this.currentext;
    data['extmode'] = this.extmode;
    data['currencyname'] = this.currencyname;
    data['incdecvalue'] = this.incdecvalue;
    data['incdeconext'] = this.incdeconext;
    data['rowid'] = this.rowid;
    data['startdate'] = this.startdate;
    data['enddate'] = this.enddate;
    data['enddatevirtual'] = this.enddatevirtual;
    data['remainingtime'] = this.remainingtime;
    data['bidderstartprice'] = this.bidderstartprice;
    data['bidderh1l1price'] = this.bidderh1l1price;
    data['bidderreserveprice'] = this.bidderreserveprice;
    data['incdecper'] = this.incdecper;
    data['bidderincdecvalue'] = this.bidderincdecvalue;
    data['isautobidrunning'] = this.isautobidrunning;
    data['basecurrencyname'] = this.basecurrencyname;
    data['bidderlastvalidbidamount'] = this.bidderlastvalidbidamount;
    data['utcenddatevirtual'] = this.utcenddatevirtual;
    data['extendby'] = this.extendby;
    data['extendwhen'] = this.extendwhen;
    data['emdamount'] = this.emdamount;
    data['emdbalance'] = this.emdbalance;
    data['minqty'] = this.minqty;
    data['bidpriceincdecintimes'] = this.bidpriceincdecintimes;
    data['isshowreservepricetobidder'] = this.isshowreservepricetobidder;
    data['checkreserveprice'] = this.checkreserveprice;
    data['noofbidallowed'] = this.noofbidallowed;
    data['eventtypeid'] = this.eventtypeid;
    data['firstbidcond'] = this.firstbidcond;
    data['isitemselection'] = this.isitemselection;
    data['auctionresult'] = this.auctionresult;
    data['incdecoptions'] = this.incdecoptions;
    data['isauctionarchive'] = this.isauctionarchive;
    data['isitemwisetime'] = this.isitemwisetime;
    data['configuretimeforitem'] = this.configuretimeforitem;
    data['auctiontype'] = this.auctiontype;
    data['decimalvalueupto'] = this.decimalvalueupto;
    data['isemdreq'] = this.isemdreq;
    data['formula'] = this.formula;
    if (this.auctionCellValueList != null) {
      data['AuctionCellValueList'] =
          this.auctionCellValueList!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  int? _toInt(dynamic value) {
    if (value is int) {
      return value;
    } else if (value is double) {
      return value.toInt();
    } else if (value is String) {
      return int.tryParse(value);
    }
    return null;
  }

  double? _toDouble(dynamic value) {
    if (value is double) {
      return value;
    } else if (value is int) {
      return value.toDouble();
    } else if (value is String) {
      return double.tryParse(value);
    }
    return null;
  }
}

class AuctionCellValueList {
  int? columnno;
  int? columnid;
  int? isflag;
  var cellvalue; // Keeping cellvalue as var since its type is not specified
  int? filledby;
  int? cellid;
  int? rowid;
  int? cellno;
  int? isshown;
  int? columntypeid;
  int? tableid;
  int? objectid;
  int? sortorder;

  AuctionCellValueList({
    this.columnno,
    this.columnid,
    this.isflag,
    this.cellvalue,
    this.filledby,
    this.cellid,
    this.rowid,
    this.cellno,
    this.isshown,
    this.columntypeid,
    this.tableid,
    this.objectid,
    this.sortorder,
  });

  AuctionCellValueList.fromJson(Map<String, dynamic> json) {
    columnno = _toInt(json['columnno']);
    columnid = _toInt(json['columnid']);
    isflag = _toInt(json['isflag']);
    cellvalue = json['cellvalue'];
    filledby = _toInt(json['filledby']);
    cellid = _toInt(json['cellid']);
    rowid = _toInt(json['rowid']);
    cellno = _toInt(json['cellno']);
    isshown = _toInt(json['isshown']);
    columntypeid = _toInt(json['columntypeid']);
    tableid = _toInt(json['tableid']);
    objectid = _toInt(json['objectid']);
    sortorder = _toInt(json['sortorder']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['columnno'] = this.columnno;
    data['columnid'] = this.columnid;
    data['isflag'] = this.isflag;
    data['cellvalue'] = this.cellvalue;
    data['filledby'] = this.filledby;
    data['cellid'] = this.cellid;
    data['rowid'] = this.rowid;
    data['cellno'] = this.cellno;
    data['isshown'] = this.isshown;
    data['columntypeid'] = this.columntypeid;
    data['tableid'] = this.tableid;
    data['objectid'] = this.objectid;
    data['sortorder'] = this.sortorder;
    return data;
  }

  int? _toInt(dynamic value) {
    if (value is int) {
      return value;
    } else if (value is double) {
      return value.toInt();
    } else if (value is String) {
      return int.tryParse(value);
    }
    return null;
  }
}

class AuctionColumnHeader {
  int? columnid;
  int? tableid;
  int? columnno;
  int? columntypeid;
  String? columnheader;
  int? filledby;
  int? datatype;
  int? sortorder;
  int? isshown;
  int? iscurrconvreq;
  int? isflag;

  AuctionColumnHeader({
    this.columnid,
    this.tableid,
    this.columnno,
    this.columntypeid,
    this.columnheader,
    this.filledby,
    this.datatype,
    this.sortorder,
    this.isshown,
    this.iscurrconvreq,
    this.isflag,
  });

  AuctionColumnHeader.fromJson(Map<String, dynamic> json) {
    columnid = _toInt(json['columnid']);
    tableid = _toInt(json['tableid']);
    columnno = _toInt(json['columnno']);
    columntypeid = _toInt(json['columntypeid']);
    columnheader = json['columnheader'];
    filledby = _toInt(json['filledby']);
    datatype = _toInt(json['datatype']);
    sortorder = _toInt(json['sortorder']);
    isshown = _toInt(json['isshown']);
    iscurrconvreq = _toInt(json['iscurrconvreq']);
    isflag = _toInt(json['isflag']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['columnid'] = this.columnid;
    data['tableid'] = this.tableid;
    data['columnno'] = this.columnno;
    data['columntypeid'] = this.columntypeid;
    data['columnheader'] = this.columnheader;
    data['filledby'] = this.filledby;
    data['datatype'] = this.datatype;
    data['sortorder'] = this.sortorder;
    data['isshown'] = this.isshown;
    data['iscurrconvreq'] = this.iscurrconvreq;
    data['isflag'] = this.isflag;
    return data;
  }

  int? _toInt(dynamic value) {
    if (value is int) {
      return value;
    } else if (value is double) {
      return value.toInt();
    } else if (value is String) {
      return int.tryParse(value);
    }
    return null;
  }
}
