class changepassword {
  String? message;
  int? statusCode;
  bool? responseData;

  changepassword({this.message, this.statusCode, this.responseData});

  changepassword.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    responseData = json['responseData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['statusCode'] = this.statusCode;
    data['responseData'] = this.responseData;
    return data;
  }
}
