import 'dart:collection';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:votes_app/Data.dart';
import 'package:votes_app/voteScreen.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';


class resultsPage extends StatelessWidget {
  LinkedHashMap playerResults;
  resultsPage(this.playerResults);

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Vote Results"),
    ),
    body: ListView.builder(
        itemCount: playerResults.length,
        itemBuilder: (BuildContext context, int index) {
      String key = playerResults.keys.elementAt((playerResults.length-1)-index);
          return new Column(
          children: <Widget>[
      new ListTile(
      title: new Text("${index+1} - $key"),
      subtitle: new Text("votes = ${playerResults[key]}"),
      ),
      new Divider(
      height: 2.0)]);

    }
  )
  );
  }
}
