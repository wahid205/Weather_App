import 'package:get/get.dart';
import 'package:weather_app/controll/homecontroller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => HomeController(city: 'cairo'));
  }
}
