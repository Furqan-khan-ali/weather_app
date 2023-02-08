import 'package:weather_app/modules/coord.dart';
import 'package:weather_app/modules/main.dart';

class WeatherResponse{
  String? name;
  Coord? coord;
  Main? main;


  WeatherResponse({this.name, this.coord, this.main});

  factory WeatherResponse.fromJson(Map<String,dynamic> jsonData){
    var weatherResponse = WeatherResponse();

    weatherResponse.name = jsonData['name'];
    weatherResponse.coord = Coord.fromJson(jsonData['coord']);
    weatherResponse.main = Main.fromJson(jsonData['main']);

    return weatherResponse;
  }


}