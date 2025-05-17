class WeatherModel {
  final double tempC;
  final String condition;
  final String name;

  WeatherModel({required this.tempC, required this.condition,required this.name});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      name: json['location']['name'],
      tempC: json['current']['temp_c'],
      condition: json['current']['condition']['text'],
    );
  }
}