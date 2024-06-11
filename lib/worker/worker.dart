import 'dart:convert';
import 'package:http/http.dart' as http;

class worker {
  String location;

  worker({required this.location});

  String temp = '';
  String humidity = '';
  String airSpeed = '';
  String description = '';
  String main = '';

  Future<void> getData() async {
    try {
      final response = await http.get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location,key"));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        List<dynamic> weatherData = data['weather'];
        Map<String, dynamic> weatherMainData = weatherData[0];
        String getMainDes = weatherMainData['main'];
        String getDesc = weatherMainData['description'];

        Map<String, dynamic> tempData = data['main'];
        Map<String, dynamic> wind = data['wind'];
        double getAirSpeed = wind["speed"];
        int getHumidity = tempData["humidity"];
        double getTemp = tempData['temp'] - 273.15; // Convert from Kelvin to Celsius

        temp = getTemp.toStringAsFixed(2);
        humidity = getHumidity.toString();
        airSpeed = getAirSpeed.toString();
        description = getDesc;
        main = getMainDes;
      } else {
        print('Failed to load weather data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
