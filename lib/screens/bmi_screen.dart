import 'package:flutter/material.dart';

class BMIScreen extends StatefulWidget {
  @override
  _BMIScreenState createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  double bmiResult = 0.0;
  String bmiStatus = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(height: 16.0),
                    TextField(
                      controller: weightController,
                      keyboardType: TextInputType.number,
                      decoration:
                          InputDecoration(labelText: 'Enter Weight (kg)'),
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      controller: heightController,
                      keyboardType: TextInputType.number,
                      decoration:
                          InputDecoration(labelText: 'Enter Height (cm)'),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        calculateBMI();
                      },
                      child: Text('Calculate BMI'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Card(
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Result',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text('BMI Result: $bmiResult'),
                    SizedBox(height: 16.0),
                    Text('BMI Status: $bmiStatus'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void calculateBMI() {
    double weight = double.parse(weightController.text);
    double height =
        double.parse(heightController.text) / 100; // Convert cm to m

    double bmi = weight / (height * height);

    setState(() {
      bmiResult = bmi;
      bmiStatus = getBMIStatus(bmi);
    });
  }

  String getBMIStatus(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal (Healthy Weight)';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: BMIScreen(),
  ));
}
