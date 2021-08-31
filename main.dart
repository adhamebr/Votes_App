import 'package:flutter/material.dart';
import 'package:votes_app/Home.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  // flutterDataSet();
  return runApp(new MaterialApp(
    debugShowMaterialGrid: false,
    debugShowCheckedModeBanner: false,
    title: 'Votes App',
    home: Home(),
  ));
}
