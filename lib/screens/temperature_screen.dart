import 'package:flutter/material.dart';

enum TemperatureUnit {
  Celsius,
  Fahrenheit,
  Kelvin,
}

class TemperatureConverter extends StatefulWidget {
  const TemperatureConverter({super.key});

  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  double inputValue = 0;
  double resultValue = 0;
  TemperatureUnit inputUnit = TemperatureUnit.Celsius;
  TemperatureUnit resultUnit = TemperatureUnit.Celsius;

  void _updateValues() {
    setState(() {
      switch (inputUnit) {
        case TemperatureUnit.Celsius:
          resultValue = _convertCelsius();
          break;
        case TemperatureUnit.Fahrenheit:
          resultValue = _convertFahrenheit();
          break;
        case TemperatureUnit.Kelvin:
          resultValue = _convertKelvin();
          break;
      }
    });
  }

  double _convertCelsius() {
    switch (resultUnit) {
      case TemperatureUnit.Celsius:
        return inputValue;
      case TemperatureUnit.Fahrenheit:
        return (inputValue * 9 / 5) + 32;
      case TemperatureUnit.Kelvin:
        return inputValue + 273.15;
    }
  }

  double _convertFahrenheit() {
    switch (resultUnit) {
      case TemperatureUnit.Celsius:
        return (inputValue - 32) * 5 / 9;
      case TemperatureUnit.Fahrenheit:
        return inputValue;
      case TemperatureUnit.Kelvin:
        return (inputValue - 32) * 5 / 9 + 273.15;
    }
  }

  double _convertKelvin() {
    switch (resultUnit) {
      case TemperatureUnit.Celsius:
        return inputValue - 273.15;
      case TemperatureUnit.Fahrenheit:
        return (inputValue - 273.15) * 9 / 5 + 32;
      case TemperatureUnit.Kelvin:
        return inputValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Temperature Converter'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter Temperature',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(12),
                ),
                onChanged: (value) {
                  setState(() {
                    inputValue = double.tryParse(value) ?? 0;
                    _updateValues();
                  });
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton<TemperatureUnit>(
                    value: inputUnit,
                    onChanged: (TemperatureUnit? value) {
                      if (value != null) {
                        setState(() {
                          inputUnit = value;
                          _updateValues();
                        });
                      }
                    },
                    items: TemperatureUnit.values
                        .map<DropdownMenuItem<TemperatureUnit>>(
                          (TemperatureUnit unit) => DropdownMenuItem<TemperatureUnit>(
                            value: unit,
                            child: Text(unit.toString().split('.').last),
                          ),
                        )
                        .toList(),
                  ),
                  const Icon(Icons.arrow_forward),
                  DropdownButton<TemperatureUnit>(
                    value: resultUnit,
                    onChanged: (TemperatureUnit? value) {
                      if (value != null) {
                        setState(() {
                          resultUnit = value;
                          _updateValues();
                        });
                      }
                    },
                    items: TemperatureUnit.values
                        .map<DropdownMenuItem<TemperatureUnit>>(
                          (TemperatureUnit unit) => DropdownMenuItem<TemperatureUnit>(
                            value: unit,
                            child: Text(unit.toString().split('.').last),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Result: $resultValue ${resultUnit.toString().split('.').last}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureConverter());
}
