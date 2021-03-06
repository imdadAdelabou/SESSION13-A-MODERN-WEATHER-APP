import 'package:clima/services/location.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/utilities/network_helper.dart';

class WeatherModel {
  double _latitude;
  double _longitude;

  Future<dynamic> getWheaterByCityName(String cityName) async {
    try {
      var url =
          "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$kAPIKEY";
      NetworkHelper networkHelper = NetworkHelper(url: url);
      var response = await networkHelper.getData();
      return response;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<dynamic> getWheaterData() async {
    Location dataLocation = Location();
    await dataLocation.getLocation();
    _latitude = dataLocation.getLatitude();
    _longitude = dataLocation.getLongitude();
    if (_latitude != null && _longitude != null) {
      NetworkHelper networkHelper = NetworkHelper(
          url:
              "https://api.openweathermap.org/data/2.5/weather?lat=$_latitude&lon=$_longitude&appid=$kAPIKEY&units=metric");
      return await networkHelper.getData();
    }
    return null;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
