class BidSubmit {
  String? message;
  int? statusCode;
  ResponseData? responseData;

  BidSubmit({this.message, this.statusCode, this.responseData});

  BidSubmit.fromJson(Map<String, dynamic> json) {
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
  int? rowId;
  String? bidResponseMessage;
  int? validBidFlag;
  int? rejectStatus;

  ResponseData(
      {this.rowId,
      this.bidResponseMessage,
      this.validBidFlag,
      this.rejectStatus});

  ResponseData.fromJson(Map<String, dynamic> json) {
    rowId = json['rowId'];
    bidResponseMessage = json['bidResponseMessage'];
    validBidFlag = json['validBidFlag'];
    rejectStatus = json['rejectStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rowId'] = this.rowId;
    data['bidResponseMessage'] = this.bidResponseMessage;
    data['validBidFlag'] = this.validBidFlag;
    data['rejectStatus'] = this.rejectStatus;
    return data;
  }
}
