import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontSize: 100.0,
);


const kMessageTextStyle = TextStyle(
  fontSize: 60.0,
);


const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
);


const kConditionTextStyle = TextStyle(
  fontSize: 70.0,
);

const kTextDecoration=InputDecoration(
  fillColor:Colors.white,
  filled:true,
  icon:Icon(Icons.location_city,color:Colors.white,),
  hintText:'Enter City Name',
  hintStyle:TextStyle(
      color:Colors.grey
  ),
 border: OutlineInputBorder(
  borderRadius:BorderRadius.all(Radius.circular(20.0),
  ),
 ),
);
