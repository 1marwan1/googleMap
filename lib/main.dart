import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hotel_data/features/google_map/data/model/notfication_modle.dart';

import 'core/firebase/firebase_message.dart';
import 'core/theme_app.dart';

import 'features/google_map/presention/view/google_maps_page.dart';

List<NotficationModel> dataNotficationModel = [];
Future backgroudMessage(RemoteMessage message) async {
  dataNotficationModel.add(NotficationModel(
      title: message.notification!.title ?? "not title",
      body: message.notification!.body ?? "not body"));
}

FirebaseMessageGoogleMapImp? firebaseMessageGoogleMapImp;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(backgroudMessage);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    firebaseMessageGoogleMapImp = FirebaseMessageGoogleMapImp();
    FirebaseMessaging.onMessage.listen(backgroudMessage);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'هوياتي',
      debugShowCheckedModeBanner: false,
      home: const GoogelMapsPage(),
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        primaryColor: kprimeryColor,
      ),
    );
  }
}
