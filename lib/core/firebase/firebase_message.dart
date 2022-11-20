import 'dart:convert';
import 'package:flutter/widgets.dart';

import '../../features/google_map/data/model/notfication_modle.dart';
import '../../main.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';

abstract class FirebaseMessageGoogleMap {}

class FirebaseMessageGoogleMapImp extends FirebaseMessageGoogleMap {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  final String serverToken =
      "BDWq1eRj_gvke2r5AWNj8DuTSEHeSqqCLQXz4JLCcMwUNJGB7vkhGqdCqZzPCsggRsXJnIAezw0yZXnRjblPDV0";
  VoidCallback eventDelegate = () {};
  FirebaseMessageGoogleMapImp() {
    FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
    FirebaseMessaging.onMessage.listen(showFlutterNotification);
  }
  initalMessage() async {
    var message = await FirebaseMessaging.instance.getInitialMessage();
    if (message != null) {}
  }

  String constructFCMPayload(String? token, String title, String body) {
    return jsonEncode({
      'token': token,
      'data': {
        'via': 'FlutterFire Cloud Messaging!!!',
        'count': 1,
      },
      'notification': {
        'title': title,
        'body': body,
      },
    });
  }

  Future<void> sendPushMessage(String title, String body) async {
    String? token = await getToken();
    print(token);
    if (token == null) {
      return;
    }

    try {
      await http.post(
        Uri.parse('https://api.rnfirebase.io/messaging/send'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: constructFCMPayload(token, title, body),
      );
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<String?> getToken() async {
    return await FirebaseMessaging.instance.getToken();
  }

  void showFlutterNotification(RemoteMessage message) {
    showNoiAwsm(message);
  }

  Future onBackgroundMessage(RemoteMessage message) async {
    showNoiAwsm(message);
  }

  onMessageOpenedApp() {
    FirebaseMessaging.onMessageOpenedApp.listen(((message) {
      showNoiAwsm(message);
    }));
  }

  void showNoiAwsm(RemoteMessage message) {
    dataNotficationModel.add(NotficationModel(
        title: message.notification!.title ?? "not title",
        body: message.notification!.body ?? "not body"));
    eventDelegate();
    // ignore: avoid_single_cascade_in_expression_statements
  }
}
