import 'package:get/get.dart';
import 'package:weather_check/controllers/weather_controllers.dart';

class WeatherBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<WeatherController>(()=>WeatherController());
  }
}