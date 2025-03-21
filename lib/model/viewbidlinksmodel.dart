class viewbiddinghalllinks {
  String? message;
  int? statusCode;
  ResponseData? responseData;

  viewbiddinghalllinks({this.message, this.statusCode, this.responseData});

  viewbiddinghalllinks.fromJson(Map<String, dynamic> json) {
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
  List<LinkLists>? linkLists;
  bool? auctionArchive;

  ResponseData({this.linkLists, this.auctionArchive});

  ResponseData.fromJson(Map<String, dynamic> json) {
    if (json['linkLists'] != null) {
      linkLists = <LinkLists>[];
      json['linkLists'].forEach((v) {
        linkLists!.add(new LinkLists.fromJson(v));
      });
    }
    auctionArchive = json['auctionArchive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.linkLists != null) {
      data['linkLists'] = this.linkLists!.map((v) => v.toJson()).toList();
    }
    data['auctionArchive'] = this.auctionArchive;
    return data;
  }
}

class LinkLists {
  int? linkId;
  String? linkName;

  LinkLists({this.linkId, this.linkName});

  LinkLists.fromJson(Map<String, dynamic> json) {
    linkId = json['linkId'];
    linkName = json['linkName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['linkId'] = this.linkId;
    data['linkName'] = this.linkName;
    return data;
  }
}
