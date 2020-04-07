import 'package:climate_app/screens/location_screen.dart';
import 'package:climate_app/services/weather.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const api='2c9fa0af84afc6b1aa3a941cafa78f74';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState() {
    getLocationData();
  }

  void getLocationData() async{
    var weatherData=await WeatherModel().getLocationData();
       Navigator.pushReplacement(context,
           MaterialPageRoute(builder:(context)=>LocationScreen(locationWeather:weatherData,),
           ),
       );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body:Center(
        child: Container(
          width:100,
          height:100,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:CircularProgressIndicator(
              strokeWidth:20.0,
              backgroundColor:Colors.grey,
            ),
          ),
        ),
      )
    );
  }
}