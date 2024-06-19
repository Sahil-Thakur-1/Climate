import 'package:climate/screens/location_screen.dart';
import 'package:climate/services/weatherCondition.dart';

import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    position();
  }
  void position() async{
    var weatherForcast = await WeatherCondition().weatherfor();
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => LocationScreen(response: weatherForcast,)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: const Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      )
    );
  }
}
