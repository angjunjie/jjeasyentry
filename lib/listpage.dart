import 'package:flutter/material.dart';
import 'package:easyentry/db/db_helper.dart';
import 'package:easyentry/model/location.dart';

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
        child: FutureBuilder(
          builder:
              (BuildContext context, AsyncSnapshot<List<Location>> snapshot) {
            //TODO: show proper loading screen
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text("Error");
              case ConnectionState.waiting:
                return Text("Loading...");
              case ConnectionState.active:
                return Text("Loading...");
              case ConnectionState.done:
                return ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          height: 50,
                          child: Center(
                            child: Text('${snapshot.data[index].getTitle()}'),
                          ));
                    });
            }
            return null; // unreachable
          },
          future: DbHelper.retrieveLocations(),
        ));
  }
  // Widget build(BuildContext context) {
  //   return Container(
  //       height: 44.0,
  //       child: ListView.builder(
  //           padding: const EdgeInsets.all(8),
  //           itemCount: 10,
  //           itemBuilder: (BuildContext context, int index) {
  //             return Container(
  //                 height: 50,
  //                 child: Center(
  //                   child:
  //                       Text('Test ${DbHelper.retrieveLocations().toString()}'),
  //                 ));
  //           }));
  // }
}
