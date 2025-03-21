class GetBiddingHall {
  String? message;
  int? statusCode;
  ResponseData? responseData;

  GetBiddingHall({this.message, this.statusCode, this.responseData});

  GetBiddingHall.fromJson(Map<String, dynamic> json) {
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
  List<AuctionTableValueList>? auctionTableValueList;
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
      auctionTableValueList = <AuctionTableValueList>[];
      json['AuctionTableValueList'].forEach((v) {
        auctionTableValueList!.add(new AuctionTableValueList.fromJson(v));
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
  Null? submittedon;
  int? isauctionrunnig;
  int? bidderid;
  Null? bidid;
  Null? bidderrank;
  int? exchangerate;
  int? isautoext;
  int? totalext;
  int? currentext;
  int? extmode;
  String? currencyname;
  int? incdecvalue;
  int? incdeconext;
  int? rowid;
  String? startdate;
  String? enddate;
  String? enddatevirtual;
  String? remainingtime;
  int? bidderstartprice;
  Null? bidderh1l1price;
  int? bidderreserveprice;
  int? incdecper;
  int? bidderincdecvalue;
  int? isautobidrunning;
  String? basecurrencyname;
  Null? bidderlastvalidbidamount;
  int? utcenddatevirtual;
  int? extendby;
  int? extendwhen;
  int? emdamount;
  int? emdbalance;
  int? minqty;
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

  BiddingHallDetail(
      {this.isincdecinperiod,
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
      this.auctionCellValueList});

  BiddingHallDetail.fromJson(Map<String, dynamic> json) {
    isincdecinperiod = json['isincdecinperiod'];
    submittedon = json['submittedon'];
    isauctionrunnig = json['isauctionrunnig'];
    bidderid = json['bidderid'];
    bidid = json['bidid'];
    bidderrank = json['bidderrank'];
    exchangerate = json['exchangerate'];
    isautoext = json['isautoext'];
    totalext = json['totalext'];
    currentext = json['currentext'];
    extmode = json['extmode'];
    currencyname = json['currencyname'];
    incdecvalue = json['incdecvalue'];
    incdeconext = json['incdeconext'];
    rowid = json['rowid'];
    startdate = json['startdate'];
    enddate = json['enddate'];
    enddatevirtual = json['enddatevirtual'];
    remainingtime = json['remainingtime'];
    bidderstartprice = json['bidderstartprice'];
    bidderh1l1price = json['bidderh1l1price'];
    bidderreserveprice = json['bidderreserveprice'];
    incdecper = json['incdecper'];
    bidderincdecvalue = json['bidderincdecvalue'];
    isautobidrunning = json['isautobidrunning'];
    basecurrencyname = json['basecurrencyname'];
    bidderlastvalidbidamount = json['bidderlastvalidbidamount'];
    utcenddatevirtual = json['utcenddatevirtual'];
    extendby = json['extendby'];
    extendwhen = json['extendwhen'];
    emdamount = json['emdamount'];
    emdbalance = json['emdbalance'];
    minqty = json['minqty'];
    bidpriceincdecintimes = json['bidpriceincdecintimes'];
    isshowreservepricetobidder = json['isshowreservepricetobidder'];
    checkreserveprice = json['checkreserveprice'];
    noofbidallowed = json['noofbidallowed'];
    eventtypeid = json['eventtypeid'];
    firstbidcond = json['firstbidcond'];
    isitemselection = json['isitemselection'];
    auctionresult = json['auctionresult'];
    incdecoptions = json['incdecoptions'];
    isauctionarchive = json['isauctionarchive'];
    isitemwisetime = json['isitemwisetime'];
    configuretimeforitem = json['configuretimeforitem'];
    auctiontype = json['auctiontype'];
    decimalvalueupto = json['decimalvalueupto'];
    isemdreq = json['isemdreq'];
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
}

class AuctionCellValueList {
  int? columnno;
  int? columnid;
  int? isflag;
  String? cellvalue;
  int? filledby;
  int? cellid;
  int? rowid;
  int? cellno;
  int? isshown;
  int? columntypeid;
  int? tableid;
  int? objectid;
  int? sortorder;

  AuctionCellValueList(
      {this.columnno,
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
      this.sortorder});

  AuctionCellValueList.fromJson(Map<String, dynamic> json) {
    columnno = json['columnno'];
    columnid = json['columnid'];
    isflag = json['isflag'];
    cellvalue = json['cellvalue'];
    filledby = json['filledby'];
    cellid = json['cellid'];
    rowid = json['rowid'];
    cellno = json['cellno'];
    isshown = json['isshown'];
    columntypeid = json['columntypeid'];
    tableid = json['tableid'];
    objectid = json['objectid'];
    sortorder = json['sortorder'];
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
}

class AuctionTableValueList {
  String? tablename;
  String? tableheader;
  String? tablefooter;
  int? noofrows;
  int? noofcols;
  int? isstandardform;
  int? createdon;
  int? createdby;
  int? updatedon;
  int? updatedby;
  int? cstatus;

  AuctionTableValueList(
      {this.tablename,
      this.tableheader,
      this.tablefooter,
      this.noofrows,
      this.noofcols,
      this.isstandardform,
      this.createdon,
      this.createdby,
      this.updatedon,
      this.updatedby,
      this.cstatus});

  AuctionTableValueList.fromJson(Map<String, dynamic> json) {
    tablename = json['tablename'];
    tableheader = json['tableheader'];
    tablefooter = json['tablefooter'];
    noofrows = json['noofrows'];
    noofcols = json['noofcols'];
    isstandardform = json['isstandardform'];
    createdon = json['createdon'];
    createdby = json['createdby'];
    updatedon = json['updatedon'];
    updatedby = json['updatedby'];
    cstatus = json['cstatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tablename'] = this.tablename;
    data['tableheader'] = this.tableheader;
    data['tablefooter'] = this.tablefooter;
    data['noofrows'] = this.noofrows;
    data['noofcols'] = this.noofcols;
    data['isstandardform'] = this.isstandardform;
    data['createdon'] = this.createdon;
    data['createdby'] = this.createdby;
    data['updatedon'] = this.updatedon;
    data['updatedby'] = this.updatedby;
    data['cstatus'] = this.cstatus;
    return data;
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

  AuctionColumnHeader(
      {this.columnid,
      this.tableid,
      this.columnno,
      this.columntypeid,
      this.columnheader,
      this.filledby,
      this.datatype,
      this.sortorder,
      this.isshown,
      this.iscurrconvreq,
      this.isflag});

  AuctionColumnHeader.fromJson(Map<String, dynamic> json) {
    columnid = json['columnid'];
    tableid = json['tableid'];
    columnno = json['columnno'];
    columntypeid = json['columntypeid'];
    columnheader = json['columnheader'];
    filledby = json['filledby'];
    datatype = json['datatype'];
    sortorder = json['sortorder'];
    isshown = json['isshown'];
    iscurrconvreq = json['iscurrconvreq'];
    isflag = json['isflag'];
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
}
