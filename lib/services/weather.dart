import 'package:climate_app/services/location.dart';
import 'package:climate_app/services/networking.dart';

const api='2c9fa0af84afc6b1aa3a941cafa78f74';
const openWeatherUrl='https://api.openweathermap.org/data/2.5/weather';


class WeatherModel {
  double latitude,longitude;

  Future<dynamic> getLocationData() async{
   Location location=Location();
   await location.getCurrentLocation();
   NetworkingHelper networkingHelper=NetworkingHelper(
       '$openWeatherUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$api&units=metric');

   var weatherData=await networkingHelper.getData();
    return weatherData;
 }

  Future  getCityLocation(String cityName) async{
    NetworkingHelper networkingHelper=NetworkingHelper(
        '$openWeatherUrl?q=$cityName&appid=$api&units=metric');
    var weatherData=await networkingHelper.getData();
    return  weatherData;
  }


  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
