import 'dart:convert'; // Import this to use jsonDecode

class LoginModel {
  String? message;
  int? statusCode;
  ResponseData? responseData;

  LoginModel({this.message, this.statusCode, this.responseData});

  LoginModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    if (json['responseData'] is String) {
      responseData = ResponseData.fromJson(jsonDecode(json['responseData']));
    } else if (json['responseData'] is Map<String, dynamic>) {
      responseData = ResponseData.fromJson(json['responseData']);
    } else {
      responseData = null;
    }
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
  String? token;
  int? userId;
  int? usertypeId;
  int? cstatus;
  int? isFistLogin;
  int? trackLoginId;

  ResponseData(
      {this.token,
      this.userId,
      this.usertypeId,
      this.cstatus,
      this.isFistLogin,
      this.trackLoginId});

  ResponseData.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userId = json['userId'];
    usertypeId = json['usertypeId'];
    cstatus = json['cstatus'];
    isFistLogin = json['isFistLogin'];
    trackLoginId = json['trackLoginId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['userId'] = this.userId;
    data['usertypeId'] = this.usertypeId;
    data['cstatus'] = this.cstatus;
    data['isFistLogin'] = this.isFistLogin;
    data['trackLoginId'] = this.trackLoginId;
    return data;
  }
}
