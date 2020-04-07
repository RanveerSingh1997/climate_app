import 'package:climate_app/screens/city_screen.dart';
import 'package:climate_app/services/weather.dart';
import 'package:climate_app/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel=WeatherModel();
  int temperature;
  String weatherIcon;
  String cityName;
  String weatherMsg;
  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData){
    var temp=weatherData['main']['temp'];
    temperature=temp.toInt();
    var condition=weatherData['weather'][0]['id'];
    weatherIcon=weatherModel.getWeatherIcon(condition);
    weatherMsg=weatherModel.getMessage(temp);
    cityName=weatherData['name'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.center,
          children: <Widget>[
             Row(
               mainAxisAlignment:MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 IconButton(icon:Icon(Icons.near_me,size:50.0,), onPressed:()async{
                    var weatherData=await weatherModel.getLocationData();
                    updateUI(weatherData);
                 }),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal:10.0),
                   child: IconButton(icon:Icon(Icons.location_city,size:50.0,),
                       onPressed:() async{
                       var cityName=await Navigator.push(context,MaterialPageRoute(builder:(context)=>CityScreen(),),);
                       if(cityName!=null) {
                         var weatherData=weatherModel.getCityLocation(cityName);
                         updateUI(weatherData);
                       }
                   }),
                 ),
               ],
             ),

             Align(alignment:Alignment.topLeft,child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text(temperature.toString()+weatherIcon,style:kTempTextStyle,),
             )),

             Expanded(child: Align(alignment:Alignment.center,child: Text(cityName, style:kConditionTextStyle))),

             Expanded(child: Align(alignment:Alignment.bottomRight,child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text(weatherMsg,textAlign:TextAlign.justify, style:kMessageTextStyle ),
             ))),

           ],
        ),
      ),
    );
  }
}
