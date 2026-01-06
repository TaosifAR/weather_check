import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_check/controllers/weather_controllers.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final WeatherController controller = Get.find<WeatherController>();
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Obx(() {
          return controller.isSearching.value
              ? TextField(
                  controller: searchController,
                  autofocus: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: "Search city...",
                    hintStyle: TextStyle(color: Colors.white54),
                    border: InputBorder.none,
                  ),
                  onSubmitted: (value) {
                    print("searching for $value");
                    controller.searchWeather(value);
                    controller.toggleSearch();
                  },
                )
              : const Text(
                  "Weather Check",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                );
        }),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                searchController.clear();
                controller.toggleSearch();
              },
              child: Icon(controller.isSearching.value? Icons.close : Icons.search, size: 30, color: Colors.white),
            ),
          ),
        ],
      backgroundColor: Colors.blueGrey[900],),
      body: Obx((){
        if(controller.isLoading.value){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if(controller.weatherData.isEmpty)
          {
            return Center(

              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Text("Search a city to see weather.",
                style: TextStyle(
                    color: Colors.blueGrey[900],
                    fontSize: 60,
                    fontWeight: FontWeight.bold
                ),),
              ),
            );
          }
        final data = controller.weatherData;

        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(


            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                Text(
                  data['name'],
                  style: TextStyle(
                    color: Colors.blueGrey[900],
                    fontSize: 50,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${data['main']['temp']}°C"
                ,style: TextStyle(
                    color: Colors.blueGrey[900],
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  data['weather'][0]['description'],
                  style:  TextStyle(
                    color: Colors.blueGrey[900],
                    fontSize: 20,
                    fontWeight: FontWeight.bold,

                ),

                )],

            ),
          ),
        );
      })
    );
  }
}
