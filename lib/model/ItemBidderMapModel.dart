import 'dart:convert';

class ItemBidderMap {
  String? message;
  int? statusCode;
  dynamic responseData;

  ItemBidderMap({this.message, this.statusCode, this.responseData});

  ItemBidderMap.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];

    // Check if responseData is a JSON string and decode it
    if (json['responseData'] is String) {
      try {
        responseData = jsonDecode(json['responseData']);
      } catch (e) {
        responseData = json['responseData'];
      }
    } else {
      responseData = json['responseData'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['statusCode'] = statusCode;

    // Encode responseData as a JSON string if it is a Map or List
    if (responseData is Map || responseData is List) {
      data['responseData'] = jsonEncode(responseData);
    } else {
      data['responseData'] = responseData;
    }

    return data;
  }
}
