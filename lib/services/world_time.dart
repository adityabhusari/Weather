import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location; //loc that will be shown in the UI
  String time='';// time in that loc
  String url; // url loc that would be passed to the get fun
  String flag;//url asset for the flag
  late bool dayTime;//is daytime or not

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      http.Response response = await http.get(
          Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offsetMin = data['utc_offset'].substring(4, 6);
      String offsetHr = data['utc_offset'].substring(1, 3);
      DateTime now = DateTime.parse(datetime.substring(0, 26));
      //parse adds the offset by default
      now = now.add(
          Duration(hours: int.parse(offsetHr), minutes: int.parse(offsetMin)));
      time = DateFormat.jm().format(now);
      dayTime= now.hour>6 && now.hour<20? true:false;
    }
    catch (e){
      time='Lmao DED';
    }
  }
}

