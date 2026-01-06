import 'package:get/get.dart';
import 'package:weather_check/models/weather_model.dart';
class WeatherController extends GetxController{
  final WeatherService service = WeatherService();
  var isSearching = false.obs;
  var weatherData = {}.obs;
  var isLoading = false.obs;
  void toggleSearch()
  {
    isSearching.value = !isSearching.value;
  }

  Future<void> searchWeather(String city) async{
    if(city.isEmpty) return;
    try{
      isLoading.value = true;
      final data = await service.fetchWeather(city);
      weatherData.value = data;
    }
    catch(e)
    {
      Get.snackbar('Error', "City not found.");
      weatherData.clear();
    }
    finally{
      isLoading.value = false;
    }


    isLoading.value = false;
  }
}