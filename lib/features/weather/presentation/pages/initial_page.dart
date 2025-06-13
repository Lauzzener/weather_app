import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_bloc.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(WeatherGetData());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is WeatherSuccess) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          state.weatherData.location.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            context.read<WeatherBloc>().add(WeatherGetData());
                          },
                          icon: Icon(
                            Icons.update,
                            color: Colors.black,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Column(
                      children: [
                        Text(
                          "${state.weatherData.current.temp_c} °c",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 42,
                          ),
                        ),
                        Text(state.weatherData.current.condition.text),
                        Image(
                          image: NetworkImage(
                            "https:${state.weatherData.current.condition.icon}",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(width: 2, color: Colors.white10),
                          ),
                          child: Column(
                            children: [
                              const Text("Geral"),
                              const SizedBox(height: 8),
                              Text(
                                "Humidade: ${state.weatherData.current.humidity}%",
                              ),

                              Text(
                                "Nuvens: ${state.weatherData.current.cloud}%",
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(width: 2, color: Colors.white10),
                          ),
                          child: Column(
                            children: [
                              const Text("Vento"),
                              const SizedBox(height: 8),

                              Text(
                                "Velocidade: ${state.weatherData.current.wind_kph}km/h",
                              ),
                              Text(
                                "Direção: ${state.weatherData.current.wind_dir}",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else if (state is WeatherFailure) {
              return Center(child: Text("Erro: ${state.failureMessage}"));
            }

            return Center(child: Text("Algo de errado ocorreu!"));
          },
        ),
      ),
    );
  }
}
