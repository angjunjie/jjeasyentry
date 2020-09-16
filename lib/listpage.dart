import 'package:flutter/material.dart';
import 'package:easyentry/db/db_helper.dart';

class Listpage extends StatefulWidget {
  @override
  _ListpageState createState() => _ListpageState();
}

class _ListpageState extends State<Listpage> {
  //await DbHelper.retrieveLocations()).toString()

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 44.0,
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  height: 50,
                  child: Center(
                    child:
                        Text('Test ${DbHelper.retrieveLocations().toString()}'),
                  ));
            }));
  }
}
//await DbHelper.retrieveLocations()).toString()
