import 'package:easyentry/db/database_provider.dart';

class testScan {
  int id;
  String name; // THIS NAME SHOULD BE THE NAME IN $venue

  testScan({this.id, this.name});

  //TODO: Map database column names from field names
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DatabaseProvider.COLUMN_NAME: name,
    };

    if (id != null) {
      map[DatabaseProvider.COLUMN_ID] = id;
    }

    return map;
  }

  testScan.fromMap(Map<String, dynamic> map) {
    //TODO: Map fields from database column names

    id = map[DatabaseProvider.COLUMN_ID];
    name = map[DatabaseProvider.COLUMN_NAME];
  }
}
