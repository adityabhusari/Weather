import 'package:flutter/material.dart';
import 'package:world_time/home.dart';
import 'package:world_time/loading.dart';
import 'package:world_time/chooseLoc.dart';

void main() {
  runApp(MaterialApp(
    initialRoute:'/',
    routes: {
      '/': (context)=>Loading(),
      '/home': (context)=> Home(),
      '/chooselocation': (context)=>ChooseLocation()
    },
  ));
}
