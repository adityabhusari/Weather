import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupTime() async{
    WorldTime object = WorldTime(location: 'Kolkata', flag:'india.png' , url: 'Asia/Kolkata');
    await object.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
     'location':object.location,
     'flag': object.flag,
     'uiTime':object.time,
      'isDayTime':object.dayTime
    });
  }

  @override
  void initState() {
    super.initState();
    setupTime();
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: SpinKitPouringHourGlassRefined(
          color: Colors.white,
          size: 70.0,
          duration: Duration(milliseconds: 700),
        )
      )
    );
  }
}
