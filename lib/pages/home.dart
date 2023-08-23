import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/pages/search.dart';
import 'package:weatherapp/providers/weather_provider.dart';
import 'package:weatherapp/services/weather_model.dart';
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  late WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
     weatherModel=Provider.of<WeatherProvider>(context,listen: true).weatherData;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchScreen();
                }));
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body:weatherModel==null
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'there is no weather today 😔 start',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'searching now 🔎 ',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                color: Colors.orange,
                child: Column(
                  children: [
                    const Spacer(
                      flex: 3,
                    ),
                    Text(
                      weatherModel!.cityName ?? '',
                      style: const TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'updated:${weatherModel!.date}',
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                         Image.network(
                           'https:${weatherModel!.weatherStateIcon}',
                          width: 150,
                          height: 150.0,
                           fit: BoxFit.fill,
                        ),
                        Text(
                          weatherModel!.temp.toString(),
                          style: const TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Column(children: [
                          Text(
                            'maxTemp: ${weatherModel!.maxTemp.toString()}',
                            style: const TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                          Text(
                            'minTemp: ${weatherModel!.minTemp.toString()}',
                            style: const TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ])
                      ],
                    ),
                    const Spacer(),
                    Text(
                      weatherModel!.weatherState,
                      style: const TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(
                      flex: 5,
                    ),
                  ],
                ),
              ));
  }
}
