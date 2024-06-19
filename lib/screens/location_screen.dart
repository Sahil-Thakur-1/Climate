import 'dart:convert';
import 'package:climate/screens/city_screen.dart';
import 'package:climate/services/weatherCondition.dart';
import 'package:flutter/material.dart';
import 'package:climate/constants/constants.dart';

class LocationScreen extends StatefulWidget {
  final response;

  LocationScreen({this.response, super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  var temp;
  int? condition;
  String? name;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.response);
    updateUI(widget.response);
  }

  void updateUI(dynamic weatherfor) {
    if(weatherfor==null){

    }
    else {
      setState(() {
        temp = jsonDecode(weatherfor)['main']['temp'];
        temp = temp.toInt();
        name = jsonDecode(weatherfor)['name'];
        condition = jsonDecode(weatherfor)['weather'][0]['id'];
        print("hello I am running");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    WeatherCondition weather = WeatherCondition();
    return Material(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/location_background.jpg"),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.dstATop),
        )),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async{
                      var weatherForcast = await WeatherCondition().weatherfor();
                      updateUI(weatherForcast);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.white54,
                    ),
                  ),
                  TextButton(
                    onPressed: () async{
                      var cityname = await Navigator.push(context, MaterialPageRoute(builder: (context)=>CityScreen()));
                      print(cityname);
                      if(cityname!=null){
                        var weatherForcast = await WeatherCondition().weatherforlocation(cityname);
                        updateUI(weatherForcast);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text('$temp°',
                        style: kTempTextStyle,
                        ),
                    Text(
                      '${weather.getWeatherIcon(condition!)}',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "${weather.getMessage(temp)} in $name!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
