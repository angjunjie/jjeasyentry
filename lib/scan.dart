import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:qrscan/qrscan.dart' as scanner;
//import 'package:sqflite/sqflite.dart';
//import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
//import 'package:html/parser.dart';

class ScanData {
  final String scanURL;

  ScanData({this.scanURL});
}

class Scan extends StatefulWidget {
  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  String qrResult = "You have not scanned yet!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan!"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "RESULT",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(qrResult,
                textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0)),
            SizedBox(
              height: 20.0,
            ),
            FlatButton(
              padding: EdgeInsets.all(10.0),
              child: Text("Tap to Scan QR!"),
              onPressed: () async {
                //var arr = ['Maria', 'Hotdog'];
                //MAIN CODE FOR SCANNING QRS

                var scanning = await scanner.scan();
                var splitting = scanning.split('/');
                var prodID = splitting[4];
                var url =
                    "https://backend.safeentry-qr.gov.sg/api/v2/building?client_id=" +
                        prodID; // Get product ID from the URL scanned, e.g. prodID = "PROD-200816544K-129299-UNIQLONORTHPOINTCITY-SE"
                var response = await http.get(url);
                var venue = jsonDecode(response.body)[
                    "venueName"]; // venue will be a string, e.g. "UNIQLO (Northpoint City)"

                setState(() {
                  qrResult = scanning;
                });
                // CODE FOR ALERT
                Widget cancelButton = FlatButton(
                  child: Text("Cancel"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                );

                Widget continueButton = FlatButton(
                  child: Text("Yes i would like to"),
                  onPressed: () async {
                    if (await canLaunch(scanning)) {
                      await launch(scanning);
                    } else {
                      throw 'Could not launch $scanning';
                    }
                  },
                );

                //ALERT BUTTON
                AlertDialog alert = AlertDialog(
                  title: Text("You are visiting $venue"),
                  content: Text("Are you sure you want to access this link?"),
                  actions: [cancelButton, continueButton],
                );

                //show the dialog
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    });

                //CODE TO OPEN URL
                //if (await canLaunch(scanning)) {
                //  await launch(scanning);
                // } else {
                //  throw 'Could not launch $scanning';
//}
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(color: Colors.blue, width: 3.0)),
            )
          ],
        ),
      ),
    );
  }
}
