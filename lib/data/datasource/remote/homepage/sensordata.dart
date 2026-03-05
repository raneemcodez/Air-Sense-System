class SensorData {
  final double temperature;
  final double humidity;

  SensorData({required this.temperature, required this.humidity});

  factory SensorData.fromJson(Map<String, dynamic> json) {
    return SensorData(
      temperature: (json['temperature'] as num).toDouble(),
      humidity: (json['humidity'] as num).toDouble(),
    );
  }
}
