class GetItemSelection {
  String? message;
  int? statusCode;
  ResponseData? responseData;

  GetItemSelection({this.message, this.statusCode, this.responseData});

  GetItemSelection.fromJson(Map<String, dynamic> json) {
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
  List<CellListData>? cellListData;
  List<HeaderListData>? headerListData;
  int? totalNoRecords;

  ResponseData({this.cellListData, this.headerListData, this.totalNoRecords});

  ResponseData.fromJson(Map<String, dynamic> json) {
    if (json['CellListData'] != null) {
      cellListData = <CellListData>[];
      json['CellListData'].forEach((v) {
        cellListData!.add(new CellListData.fromJson(v));
      });
    }
    if (json['HeaderListData'] != null) {
      headerListData = <HeaderListData>[];
      json['HeaderListData'].forEach((v) {
        headerListData!.add(new HeaderListData.fromJson(v));
      });
    }
    totalNoRecords = json['TotalNoRecords'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cellListData != null) {
      data['CellListData'] = this.cellListData!.map((v) => v.toJson()).toList();
    }
    if (this.headerListData != null) {
      data['HeaderListData'] =
          this.headerListData!.map((v) => v.toJson()).toList();
    }
    data['TotalNoRecords'] = this.totalNoRecords;
    return data;
  }
}

class CellListData {
  List<Cellvaluelist>? cellvaluelist;
  int? bidId;
  int? auctionId;
  int? tableId;
  int? rowId;
  String? startPrice;
  String? incDecValue;
  String? quantityValue;
  int? companyId;
  int? isActive;
  int? mapitembidderid;

  CellListData(
      {this.cellvaluelist,
      this.bidId,
      this.auctionId,
      this.tableId,
      this.rowId,
      this.startPrice,
      this.incDecValue,
      this.quantityValue,
      this.companyId,
      this.isActive,
      this.mapitembidderid});

  CellListData.fromJson(Map<String, dynamic> json) {
    if (json['cellvaluelist'] != null) {
      cellvaluelist = <Cellvaluelist>[];
      json['cellvaluelist'].forEach((v) {
        cellvaluelist!.add(new Cellvaluelist.fromJson(v));
      });
    }
    bidId = json['bidId'];
    auctionId = json['auctionId'];
    tableId = json['tableId'];
    rowId = json['rowId'];
    startPrice = json['startPrice'];
    incDecValue = json['incDecValue'];
    quantityValue = json['quantityValue'];
    companyId = json['companyId'];
    isActive = json['isActive'];
    mapitembidderid = json['mapitembidderid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cellvaluelist != null) {
      data['cellvaluelist'] =
          this.cellvaluelist!.map((v) => v.toJson()).toList();
    }
    data['bidId'] = this.bidId;
    data['auctionId'] = this.auctionId;
    data['tableId'] = this.tableId;
    data['rowId'] = this.rowId;
    data['startPrice'] = this.startPrice;
    data['incDecValue'] = this.incDecValue;
    data['quantityValue'] = this.quantityValue;
    data['companyId'] = this.companyId;
    data['isActive'] = this.isActive;
    data['mapitembidderid'] = this.mapitembidderid;
    return data;
  }
}

class Cellvaluelist {
  int? itemColumnId;
  String? itemValue;
  int? sortorder;

  Cellvaluelist({this.itemColumnId, this.itemValue, this.sortorder});

  Cellvaluelist.fromJson(Map<String, dynamic> json) {
    itemColumnId = json['itemColumnId'];
    itemValue = json['itemValue'];
    sortorder = json['sortorder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemColumnId'] = this.itemColumnId;
    data['itemValue'] = this.itemValue;
    data['sortorder'] = this.sortorder;
    return data;
  }
}

class HeaderListData {
  int? columnno;
  String? columnheader;
  int? datatype;
  int? columnid;
  int? isshown;
  int? columntypeid;
  int? tableid;
  int? sortorder;
  int? iscurrconvreq;
  int? filledby;

  HeaderListData(
      {this.columnno,
      this.columnheader,
      this.datatype,
      this.columnid,
      this.isshown,
      this.columntypeid,
      this.tableid,
      this.sortorder,
      this.iscurrconvreq,
      this.filledby});

  HeaderListData.fromJson(Map<String, dynamic> json) {
    columnno = json['columnno'];
    columnheader = json['columnheader'];
    datatype = json['datatype'];
    columnid = json['columnid'];
    isshown = json['isshown'];
    columntypeid = json['columntypeid'];
    tableid = json['tableid'];
    sortorder = json['sortorder'];
    iscurrconvreq = json['iscurrconvreq'];
    filledby = json['filledby'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['columnno'] = this.columnno;
    data['columnheader'] = this.columnheader;
    data['datatype'] = this.datatype;
    data['columnid'] = this.columnid;
    data['isshown'] = this.isshown;
    data['columntypeid'] = this.columntypeid;
    data['tableid'] = this.tableid;
    data['sortorder'] = this.sortorder;
    data['iscurrconvreq'] = this.iscurrconvreq;
    data['filledby'] = this.filledby;
    return data;
  }
}
