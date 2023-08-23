import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/providers/weather_provider.dart';

import '../services/weather_model.dart';
import '../services/weather_services.dart';
import '../test.dart';
class SearchScreen  extends StatelessWidget {
  String?cityNames;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Search for your City'),
      ),
      body: Center(
        child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            onFieldSubmitted: (data)async{
              cityNames=data;
              WeatherServices service=WeatherServices();
              WeatherModel weather =await service.getWeather(cityName: cityNames!);
              Provider.of<WeatherProvider>(context,listen: false).weatherData=weather;
              Navigator.pop(context);
            },
            decoration:const InputDecoration(
              border:  OutlineInputBorder(),
              hintText: 'Entre a city',
              label: Text('Search'),
              contentPadding: EdgeInsets.symmetric(vertical: 32,horizontal: 24),
              suffixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}
