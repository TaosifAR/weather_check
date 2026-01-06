import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  static const apiKey = 'b3e9790a8c16b389b2b6136280e029aa';
  Future<Map<String, dynamic>> fetchWeather(String city) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(url));
   if(response.statusCode==200){
     return jsonDecode(response.body);
   }
   else{
     throw Exception('City not found');
   }
  }
}
