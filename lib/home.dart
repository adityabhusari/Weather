import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Map data={};
  Widget build(BuildContext context) {
    data = data.isEmpty?ModalRoute.of(context)!.settings.arguments as Map:data;
    String bgImg = data['isDayTime']? 'day2.jpeg':'night2.jpeg';
    Color? bgColor = data['isDayTime'] ? Colors.blue[900] : Colors.deepPurple[900];
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImg'),
              fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50, 250, 50, 10),
            child: Column(
              children: [
                OutlinedButton.icon(
                    onPressed:() async {
                      dynamic result = await Navigator.pushNamed(context,'/chooselocation');
                      setState(() {
                        data={
                        'uiTime':result['uiTime'],
                          'location': result['location'],
                          'flag':result['flag'],
                          'isDayTime':result['isDayTime']
                        };
                      });
                    },
                    icon: Icon(
                        Icons.edit_location,
                    color: Colors.grey[900],
                      size: 30,
                    ),
                  label: Text(
                    "Choose location",
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 20
                  ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 30,
                        letterSpacing: 2,
                        color: Colors.grey[900]
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Text(
                  data['uiTime'],
                  style: TextStyle(
                      fontSize: 60,
                      letterSpacing: 2,
                      color: Colors.grey[900]
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
