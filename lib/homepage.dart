import 'scan.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image(
                image: NetworkImage(
                    'https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX39210612.jpg')),
            scanQRButton("SCAN QR CODE", Scan()),
            //retrieveDbButton("RETRIEVE DATABASE",   ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget scanQRButton(String text, Widget widget) {
    return FlatButton(
      padding: EdgeInsets.all(10.0),
      child: Text(text),
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => widget));
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(color: Colors.blue, width: 3.0)),
    );
  }

  Widget retrieveDbButton(String text, Widget widget) {
    return FlatButton(
      padding: EdgeInsets.all(10.0),
      child: Text(text),
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => widget));
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(color: Colors.blue, width: 3.0)),
    );
  }
}
