import 'package:flutter/material.dart';
import '../../../../../core/theme_app.dart';
import '../../../presention/widget/elvevated_button_google_map-widget.dart';

class SplitSendNofipage extends StatelessWidget {
  SplitSendNofipage({required this.sendButtonEvent, Key? key})
      : super(key: key);
  VoidCallback sendButtonEvent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/025-location(1).png",
            color: kprimeryColor,
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width,
          ),
          ElveatedButtonGoogleMapWidget(
            voidCallBakElveatateButtonGM: sendButtonEvent,
            nameButton: "ارسال اشعار",
          ),
        ],
      ),
    );
  }
}
