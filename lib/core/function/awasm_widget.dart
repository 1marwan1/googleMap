import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import '../../main.dart';

void awesomeDialogWidget(BuildContext context) {
  var awesomeDialog = AwesomeDialog(
      context: context,
      title: dataNotficationModel[dataNotficationModel.length - 1].title,
      body: Text(dataNotficationModel[dataNotficationModel.length - 1].body,
          style: const TextStyle(fontSize: 15)));
  awesomeDialog.show();
}
