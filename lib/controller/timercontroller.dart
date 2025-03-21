import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'homecontroller.dart';

class TimerController extends GetxController {
  BuildContext context;
  TimerController({required this.context});
  var remainingSeconds = 100.obs;
  Timer? countdownTimer;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    countdownTimer?.cancel();
    super.onClose();
  }

  void _startCountdownTimer() {
    countdownTimer?.cancel(); // Cancel any existing timer
    remainingSeconds.value = 100;
    final get = Get.put(homeController(context: context));
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds.value > 0) {
        remainingSeconds.value--;
        if (get.autobiddingstates.value == false) {
          timer.cancel();
        }
      } else {
        timer.cancel();
        performTask(); // Perform the task again after countdown finishes
      }
    });
  }

  Future<void> performTask() async {
    final get = Get.put(homeController(context: context));
    if (get.autobiddingstates.value) {
      await get.Dynbiddinghallauto("auto");
      await get.autobidding();
      await get.Dynbiddinghallauto("auto");
      // await Future.delayed(Duration(seconds: 7));
      _startCountdownTimer();
    } else {}

    // Perform the task here (simulate with a delay)

    // Task completed, start the countdown timer
  }
}
