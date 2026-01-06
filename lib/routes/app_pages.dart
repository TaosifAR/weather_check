import 'package:get/get.dart';
import 'package:weather_check/binding/auth_binding.dart';
import 'package:weather_check/binding/weather_binding.dart';
import 'package:weather_check/views/auth/login_screen.dart';
import 'package:weather_check/views/auth/registration_screen.dart';
import 'package:weather_check/views/weather/home_screen.dart';

import 'app_routes.dart';

class AppPages{

  static const INITIAL = Routs.login;
  static final routes = [
    GetPage(
        name: Routs.login,
        page: ()=> LoginScreen(),
        binding: AuthBinding()
    ),
    GetPage(
        name: Routs.register,
        page: ()=> RegistrationScreen(),
        binding: AuthBinding()
    ),
    GetPage(
        name: Routs.home,
        page:()=> HomeScreen(),
        binding: WeatherBinding()

    )


  ];

}