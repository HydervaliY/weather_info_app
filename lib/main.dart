import 'package:flutter/material.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Info App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatefulWidget {
  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  final TextEditingController _controller = TextEditingController();
  String _cityName = '';
  String _weatherInfo = '';

  void _fetchWeather() {
    setState(() {
      _cityName = _controller.text;
      // Simulated weather data
      _weatherInfo = 'Sunny, ${15 + (25 * (0.5 - (new DateTime.now().millisecond % 100) / 100))}°C';
    });
  }

void _fetch7DayForecast() {
  setState(() {
    _cityName = _controller.text;
    // Simulated forecast data for 7 days
    _weatherInfo = 'Forecast for $_cityName:\n1. Sunny, 25°C\n2. Cloudy, 20°C\n3. Rainy, 18°C\n4. Sunny, 26°C\n5. Windy, 22°C\n6. Rainy, 19°C\n7. Sunny, 24°C';
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter city name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _fetchWeather,
              child: Text('Fetch Weather'),
            ),
            ElevatedButton(
              onPressed: _fetch7DayForecast,
              child: Text('Fetch 7-Day Forecast'),
            ),

            SizedBox(height: 16),
            if (_cityName.isNotEmpty && _weatherInfo.isNotEmpty)
              Text(
                'Weather in $_cityName: $_weatherInfo',
                style: TextStyle(fontSize: 20),
              ),
          ],
        ),
      ),
    );
  }
}
//last commit for excuted code