import 'package:climate/services/weather.dart';
import 'package:climate/services/location.dart';
class WeatherCondition{

  Future<dynamic> weatherfor()async{
    Location location = Location();
    await location.getcurrentlocation();
    var longitude = location.long;
    var latitude = location.lat;
    var weatherForcast = await Weather(longitude,latitude);
    return weatherForcast;
  }
  Future<dynamic> weatherforlocation(var cityname) async{
    var weatherForcast = await WeatherLocation(cityname);
    return weatherForcast;
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