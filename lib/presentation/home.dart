import 'package:clean_arch_study_1/internal/dependensies/home_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../domain/model/day.dart';
import '../domain/state/home_state.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final _latController = TextEditingController();
  late final _lonController = TextEditingController();

  late HomeState _homeState;

  @override
  void initState() {
    super.initState();
    _homeState = HomeModule.homeState;
  }

  _getDay() {
    final lat = double.tryParse(_latController.text) ?? 0;
    final lon = double.tryParse(_lonController.text) ?? 0;

    _homeState.getDay(latitude: lat, longitude: lon);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope
          .of(context)
          .unfocus,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _latController,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                          signed: true,
                        ),
                        decoration: const InputDecoration(hintText: 'Широта'),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextField(
                        controller: _lonController,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                          signed: true,
                        ),
                        decoration: const InputDecoration(hintText: 'Долгота'),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _getDay,
                  child: const Text('Получить'),
                ),
                const SizedBox(height: 20),
                Observer(
                    builder: (_) {
                      if (_homeState.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      final day = _homeState.day;
                      if (day == null) {
                        return Container();
                      }

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('Восход: ${day.sunrise.toLocal()}'),
                          Text('Заход: ${day.sunset.toLocal()}'),
                          Text('Полдень: ${day.solarNoon.toLocal()}'),
                          Text('Продолжительность: ${Duration(seconds: day.dayLength)}'),
                        ],
                      );
                    }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
