class ViewBidder {
  String? message;
  int? statusCode;
  ResponseData? responseData;

  ViewBidder({this.message, this.statusCode, this.responseData});

  ViewBidder.fromJson(Map<String, dynamic> json) {
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
  String? email;
  String? personName;
  String? address;
  String? companyName;
  String? state;
  String? country;
  String? city;
  String? phoneNo;
  String? mobileNo;
  String? website;
  String? timeZone;
  Null? keyword;
  Null? panNo;
  Null? accountHolderName;
  Null? bankAccountNo;
  Null? bankName;
  Null? ifscCode;
  Null? branchCreateDTOList;
  int? isbiddergstreq;
  int? isbidderaadharreq;
  String? aadharNo;
  String? gstNo;
  String? phoneCode;
  bool? onlinePayment;

  ResponseData(
      {this.email,
      this.personName,
      this.address,
      this.companyName,
      this.state,
      this.country,
      this.city,
      this.phoneNo,
      this.mobileNo,
      this.website,
      this.timeZone,
      this.keyword,
      this.panNo,
      this.accountHolderName,
      this.bankAccountNo,
      this.bankName,
      this.ifscCode,
      this.branchCreateDTOList,
      this.isbiddergstreq,
      this.isbidderaadharreq,
      this.aadharNo,
      this.gstNo,
      this.phoneCode,
      this.onlinePayment});

  ResponseData.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    personName = json['personName'];
    address = json['address'];
    companyName = json['companyName'];
    state = json['state'];
    country = json['country'];
    city = json['city'];
    phoneNo = json['phoneNo'];
    mobileNo = json['mobileNo'];
    website = json['website'];
    timeZone = json['timeZone'];
    keyword = json['keyword'];
    panNo = json['panNo'];
    accountHolderName = json['accountHolderName'];
    bankAccountNo = json['bankAccountNo'];
    bankName = json['bankName'];
    ifscCode = json['ifscCode'];
    branchCreateDTOList = json['branchCreateDTOList'];
    isbiddergstreq = json['isbiddergstreq'];
    isbidderaadharreq = json['isbidderaadharreq'];
    aadharNo = json['aadharNo'];
    gstNo = json['gstNo'];
    phoneCode = json['phoneCode'];
    onlinePayment = json['onlinePayment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['personName'] = this.personName;
    data['address'] = this.address;
    data['companyName'] = this.companyName;
    data['state'] = this.state;
    data['country'] = this.country;
    data['city'] = this.city;
    data['phoneNo'] = this.phoneNo;
    data['mobileNo'] = this.mobileNo;
    data['website'] = this.website;
    data['timeZone'] = this.timeZone;
    data['keyword'] = this.keyword;
    data['panNo'] = this.panNo;
    data['accountHolderName'] = this.accountHolderName;
    data['bankAccountNo'] = this.bankAccountNo;
    data['bankName'] = this.bankName;
    data['ifscCode'] = this.ifscCode;
    data['branchCreateDTOList'] = this.branchCreateDTOList;
    data['isbiddergstreq'] = this.isbiddergstreq;
    data['isbidderaadharreq'] = this.isbidderaadharreq;
    data['aadharNo'] = this.aadharNo;
    data['gstNo'] = this.gstNo;
    data['phoneCode'] = this.phoneCode;
    data['onlinePayment'] = this.onlinePayment;
    return data;
  }
}
