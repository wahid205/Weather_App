import 'package:get/get.dart';
import 'package:weather_app/modell/currentweather.dart';
import 'package:weather_app/modell/fivedays.dart';
import 'package:weather_app/service/weatherservice.dart';

class HomeController extends GetxController {
  String? city;
  HomeController({this.city});
  Currentweather currentweather = Currentweather();
  List<FiveDays> fiveday = [];
  List<String> datalist = [];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initState();
  }

  updateWeather() {
    initState();
  }

  void initState() {
    getCurrentWeather();
    getFiveDaysData();
  }

  void getCurrentWeather() {
    WeatherService(city: city).getCurrentWeather(
      onsuccess: (current) {
        current = currentweather;
        update();
      },
      onerror: (error) {
        print(error);
        update();
      },
    );
  }

  void getFiveDaysData() {
    WeatherService(city: city).getFiveDaysForcast(
      onsuccess: (current) {
        current = fiveday;
        update();
      },
      onerror: (error) {
        print(error);
        update();
      },
    );
  }
}
