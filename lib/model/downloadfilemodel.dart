class downloadfile {
  String? message;
  int? statusCode;
  ResponseData? responseData;

  downloadfile({this.message, this.statusCode, this.responseData});

  downloadfile.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    responseData = json['responseData'] != null
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
  Null docDesc;
  Null objectId;
  Null linkId;
  Null cstatus;
  Null cstatusdocview;
  Null isUserIdwisePath;
  Null allowFileExist;
  Null childId;
  String? fileContent;
  String? fileName;
  Null isSpecialClient;
  Null fileSize;
  int? userId;
  int? clientId;
  int? userTypeId;

  ResponseData(
      {this.docDesc,
      this.objectId,
      this.linkId,
      this.cstatus,
      this.cstatusdocview,
      this.isUserIdwisePath,
      this.allowFileExist,
      this.childId,
      this.fileContent,
      this.fileName,
      this.isSpecialClient,
      this.fileSize,
      this.userId,
      this.clientId,
      this.userTypeId});

  ResponseData.fromJson(Map<String, dynamic> json) {
    docDesc = json['docDesc'];
    objectId = json['objectId'];
    linkId = json['linkId'];
    cstatus = json['cstatus'];
    cstatusdocview = json['cstatusdocview'];
    isUserIdwisePath = json['isUserIdwisePath'];
    allowFileExist = json['allowFileExist'];
    childId = json['childId'];
    fileContent = json['fileContent'];
    fileName = json['fileName'];
    isSpecialClient = json['isSpecialClient'];
    fileSize = json['fileSize'];
    userId = json['userId'];
    clientId = json['clientId'];
    userTypeId = json['userTypeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['docDesc'] = this.docDesc;
    data['objectId'] = this.objectId;
    data['linkId'] = this.linkId;
    data['cstatus'] = this.cstatus;
    data['cstatusdocview'] = this.cstatusdocview;
    data['isUserIdwisePath'] = this.isUserIdwisePath;
    data['allowFileExist'] = this.allowFileExist;
    data['childId'] = this.childId;
    data['fileContent'] = this.fileContent;
    data['fileName'] = this.fileName;
    data['isSpecialClient'] = this.isSpecialClient;
    data['fileSize'] = this.fileSize;
    data['userId'] = this.userId;
    data['clientId'] = this.clientId;
    data['userTypeId'] = this.userTypeId;
    return data;
  }
}
