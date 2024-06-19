import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:climate/constants/constants.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? City;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/city_background.jpg"),
          fit: BoxFit.cover
        )
      ),
      constraints: BoxConstraints.expand(),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 50.0,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Material(
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.location_city,color: Colors.black,),
                    border:OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide.none
                    ),
                    hintText: "Enter the City",
                    hintStyle: TextStyle(
                      color: Colors.grey
                    ),

                  ),
                  onChanged: (context){
                    City = context;
                  },
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context as BuildContext,City);
              },
              child: Text(
                'Get Weather',
                style: kButtonTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
