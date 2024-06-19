import 'package:climate/services/ApiKey.dart';
import 'package:http/http.dart' as http;


Future<String> Weather(var long, var lat) async {
  var url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&units=metric&appid=$ApiKey');
  http.Response response = await http.get(url);
  if(response.statusCode==200){
    String res = response.body;
    return res;
  }
  else{
    print("status code : ${response.statusCode}");
    return "Error";
  }
}

Future<String> WeatherLocation(var cityname) async {
  var url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$ApiKey&units=metric');
  http.Response response = await http.get(url);
  if(response.statusCode==200){
    String res = response.body;
    return res;
  }
  else{
    print("status code : ${response.statusCode}");
    return "Error";
  }
}