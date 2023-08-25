import 'package:weather_app/api/apirepo.dart';
import 'package:weather_app/modell/currentweather.dart';
import 'package:weather_app/modell/fivedays.dart';

class WeatherService {
  String? city;
  WeatherService({this.city});
  String basrUrl = 'https://api.openweathermap.org/data/2.5';
  String apiKey = 'appid=2004402941d2abc41edb77890984a7d2';
  void getCurrentWeather({
    Function()? beforesend,
    Function(Currentweather current)? onsuccess,
    Function(dynamic error)? onerror,
  }) {
    final uri = '$basrUrl/weather/q=$city&$apiKey';
    ApiRepo(payload: null, url: uri).getData(beforesend: ()=>beforesend,
    onsuccess: (data)=>onsuccess!(Currentweather.fromJson(data)),onerror: (error)=>onerror!(error));
  }
  void getFiveDaysForcast({
    Function()? beforesend,
    Function(List<FiveDays> fiveDay)? onsuccess,
    Function(dynamic error)? onerror,
  }) {
    final uri = '$basrUrl/forcast/q=$city&$apiKey';
    ApiRepo(payload: null, url: uri).getData(
      beforesend: ()=>{},
      onsuccess: (data)=>{
      onsuccess!((data['list'] as List)
      .map((e) => fiveDay.fromJson(e)).toList())
    },
    onerror: (error)=>onerror!(error));
  }
}
