import 'dart:async';

import 'package:btt/controller/homecontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TimeDifferenceController extends GetxController {
  BuildContext? context;
  TimeDifferenceController({required this.context});
  var _timeLeft = ''.obs;
  var isLoading = true.obs;
  var hasError = false.obs;
  late Timer _timer;
  late DateTime endDate;

  @override
  void onInit() {
    super.onInit();
    _fetchEndDate();
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }

  Future<void> _fetchEndDate() async {
    final url = 'https://example.com/api'; // Replace with your API endpoint
    try {
      final get = Get.put(homeController(context: context!));

      // Assuming the nested structure as provided
      String endDateString = get
          .Response6.value.responseData!.biddingHallDetail![0].enddatevirtual
          .toString();

      endDate = _parseEndDateString(endDateString);
      _calculateTimeLeft();
      _timer = Timer.periodic(
          Duration(seconds: 1), (Timer t) => _calculateTimeLeft());
      isLoading.value = false;
    } catch (e) {
      hasError.value = true;
    }
  }

  DateTime _parseEndDateString(String endDateString) {
    // Parse the date string in the format "dd/MM/yyyy HH:mm:ss"
    final DateFormat format = DateFormat("dd/MM/yyyy HH:mm:ss");
    return format.parse(endDateString);
  }

  void _calculateTimeLeft() {
    final now = DateTime.now();
    final difference = endDate.difference(now);

    final days = difference.inDays;
    final hours = difference.inHours % 24;
    final minutes = difference.inMinutes % 60;
    final seconds = difference.inSeconds % 60;

    _timeLeft.value =
        '$days days, $hours hours, $minutes min, $seconds sec left';
  }

  String get timeLeft => _timeLeft.value;
}
