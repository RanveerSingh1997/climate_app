import 'package:climate_app/utilities/constants.dart';
import 'package:flutter/material.dart';


class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  var cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration:BoxDecoration(
          image:DecorationImage(
              image:AssetImage('images/city_background.jpg'),
          fit:BoxFit.cover
          )
        ),
       child:SafeArea(
         child: Column(
           children: <Widget>[
             Align(
               alignment:Alignment.topLeft,
               child:FlatButton(
                 onPressed:(){},
                 child:Icon(Icons.arrow_back_ios,size:50.0,),
               ),
             ),
             Container(
               padding:EdgeInsets.all(20.0),
               child:TextField(
                 style:TextStyle(color:Colors.black),
                 decoration:kTextDecoration,
                 onChanged:(value){
                   cityName=value;

                 },
               ),
             ),
             FlatButton(
                 onPressed: (){
                   Navigator.pop(context,cityName);
                 },
                 child:Text('Get Weather'),
             ),
           ],
         ),
       ),
      ),
    );
  }
}