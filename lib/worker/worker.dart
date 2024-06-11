import 'package:http/http.dart' as http;
import 'dart:convert';

class Worker {
  String location;

  // Initialize the fields with default values
  String temp = "";
  String humidity = "";
  String air_speed = "";
  String description = "";
  String main = "";

  Worker({required this.location});

  Future<void> getData() async {
    try {
      final response = await http.get(
          Uri.parse("http://api.openweathermap.org/data/2.5/weather?q=$location&appid="));

      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);

        Map temp_data = data['main'];
        humidity = temp_data['humidity'].toString();
        temp = (temp_data['temp'] - 273.15).toStringAsFixed(2); // Convert from Kelvin to Celsius

        Map wind = data['wind'];
        air_speed = wind["speed"].toString();

        List weather_data = data['weather'];
        Map weather_main_data = weather_data[0];
        main = weather_main_data['main'];
        description = weather_main_data["description"];
      } else {
        print("Failed to load weather data");
      }
    } catch (e) {
      print("Error occurred: $e");
    }
  }
}
