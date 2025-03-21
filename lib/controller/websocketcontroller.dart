import 'dart:convert';

import 'package:btt/controller/homecontroller.dart';
import 'package:get/get.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

import '../View/Utilites/strings.dart';

class wedsocket extends GetxController {
  late StompClient stompClient;
  String message = '';
  bool isConnected = false;

  var context;
  String token;
  String autionid;
  wedsocket(
      {required this.context, required this.token, required this.autionid});
  void connect() {
    final url = '${Strings.url}socketservice/connect';

    stompClient = StompClient(
      config: StompConfig.SockJS(
        url: '$url?token=$token',
        onConnect: onConnect,
        onStompError: onError,
        onWebSocketError: onError,
        onDisconnect: onDisconnect,
        heartbeatOutgoing: const Duration(seconds: 10),
        heartbeatIncoming: const Duration(seconds: 10),
      ),
    );

    stompClient.activate();
  }

  void onConnect(StompFrame frame) {
    print('Connected to WebSocket server');
    isConnected = true;
    print("Socket connect");
    sendMessage("asfhb");
    // notifyListeners();
  }

  void onError(dynamic error) {
    print('WebSocket error: $error');
    isConnected = false;
    // notifyListeners();
  }

  void onDisconnect(StompFrame frame) {
    print('WebSocket connection closed');
    isConnected = false;
    // notifyListeners();
  }

  void subscribeToTopic() {
    final get = Get.put(homeController(context: context));
    print("djbus2");
    stompClient.subscribe(
      destination: '/socketservice/broadcast/getlivebiddata/$autionid',
      callback: (StompFrame frame) async {
        if (frame.body != null) {
          await get.Dynbiddinghallauto("auto");
          get.Dynbiddinghall("");

          final data = json.decode(frame.body!);
          print('Received data: $data');
          // message = data.toString();

          // final shared = await SharedPreferences.getInstance();
          // String auto = shared.getString(autobid).toString();
          // // print("auto" + auto);
          // if (auto == "yes") {
          //   get.autobidding();
          // }

          // notifyListeners();
        }
      },
    );
  }

  void sendMessage(String message) {
    if (isConnected) {
      print('Sending message: $message');
      stompClient.send(
          destination: '/socketservice/send/addbid',
          headers: {},
          body: autionid);
      subscribeToTopic();
    } else {
      print('Cannot send message, not connected');
    }
  }

  @override
  void dispose() {
    stompClient.deactivate();
    super.dispose();
  }
}
