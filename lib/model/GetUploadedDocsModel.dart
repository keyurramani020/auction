class getuploadeddocs {
  String? message;
  int? statusCode;
  ResponseData? responseData;

  getuploadeddocs({this.message, this.statusCode, this.responseData});

  getuploadeddocs.fromJson(Map<String, dynamic> json) {
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
  List<DocumentDetailsDTOS>? documentDetailsDTOS;

  ResponseData({this.documentDetailsDTOS});

  ResponseData.fromJson(Map<String, dynamic> json) {
    if (json['documentDetailsDTOS'] != null) {
      documentDetailsDTOS = <DocumentDetailsDTOS>[];
      json['documentDetailsDTOS'].forEach((v) {
        documentDetailsDTOS!.add(new DocumentDetailsDTOS.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.documentDetailsDTOS != null) {
      data['documentDetailsDTOS'] =
          this.documentDetailsDTOS!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DocumentDetailsDTOS {
  String? officerDocMappingId;
  String? docName;
  String? description;
  String? fileSize;
  String? mappedOn;
  String? cstatus;
  String? officerDocId;
  String? path;
  String? hashkey;

  DocumentDetailsDTOS(
      {this.officerDocMappingId,
      this.docName,
      this.description,
      this.fileSize,
      this.mappedOn,
      this.cstatus,
      this.officerDocId,
      this.path,
      this.hashkey});

  DocumentDetailsDTOS.fromJson(Map<String, dynamic> json) {
    officerDocMappingId = json['officerDocMappingId'];
    docName = json['docName'];
    description = json['description'];
    fileSize = json['fileSize'];
    mappedOn = json['mappedOn'];
    cstatus = json['cstatus'];
    officerDocId = json['officerDocId'];
    path = json['path'];
    hashkey = json['hashkey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['officerDocMappingId'] = this.officerDocMappingId;
    data['docName'] = this.docName;
    data['description'] = this.description;
    data['fileSize'] = this.fileSize;
    data['mappedOn'] = this.mappedOn;
    data['cstatus'] = this.cstatus;
    data['officerDocId'] = this.officerDocId;
    data['path'] = this.path;
    data['hashkey'] = this.hashkey;
    return data;
  }
}
