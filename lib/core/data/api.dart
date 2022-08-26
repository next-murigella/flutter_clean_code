abstract class API {
  Future<dynamic> getWeather(
      String postalCode, String countryCode, String locale, String unit);
}
