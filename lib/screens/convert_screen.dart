import 'package:flutter/material.dart';

class ConvertMoneyPage extends StatefulWidget {
  const ConvertMoneyPage({super.key});

  @override
  _ConvertMoneyPageState createState() => _ConvertMoneyPageState();
}

class _ConvertMoneyPageState extends State<ConvertMoneyPage> {
  TextEditingController amountController = TextEditingController();
  double usdToIdrRate = 15000; // Anggap kurs 1 USD = 15000 IDR
  double usdToEuroRate = 0.85; // Anggap kurs 1 USD = 0.85 Euro
  double euroToIdrRate = 17500; // Anggap kurs 1 Euro = 17500 IDR

  String selectedFromCurrency = 'USD';
  String selectedToCurrency = 'IDR';
  List<String> currencies = ['USD', 'IDR', 'Euro'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Money Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter Amount',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: selectedFromCurrency,
                    items: currencies.map((String currency) {
                      return DropdownMenuItem<String>(
                        value: currency,
                        child: Text(currency),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedFromCurrency = newValue;
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: DropdownButton<String>(
                    value: selectedToCurrency,
                    items: currencies.map((String currency) {
                      return DropdownMenuItem<String>(
                        value: currency,
                        child: Text(currency),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedToCurrency = newValue;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                convertCurrency();
              },
              child: const Text('Convert'),
            ),
          ],
        ),
      ),
    );
  }

  void convertCurrency() {
    double amount = double.parse(amountController.text);
    double result = 0;

    if (selectedFromCurrency == 'USD' && selectedToCurrency == 'IDR') {
      result = amount * usdToIdrRate;
    } else if (selectedFromCurrency == 'USD' && selectedToCurrency == 'Euro') {
      result = amount * usdToEuroRate;
    } else if (selectedFromCurrency == 'IDR' && selectedToCurrency == 'USD') {
      result = amount / usdToIdrRate;
    } else if (selectedFromCurrency == 'IDR' && selectedToCurrency == 'Euro') {
      result = amount / euroToIdrRate;
    } else if (selectedFromCurrency == 'Euro' && selectedToCurrency == 'USD') {
      result = amount / usdToEuroRate;
    } else if (selectedFromCurrency == 'Euro' && selectedToCurrency == 'IDR') {
      result = amount * euroToIdrRate;
    }

    showResult(result);
  }

  void showResult(double result) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Conversion Result'),
          content: Text(
              'Result: $result ${selectedToCurrency == 'Euro' ? 'Euro' : 'IDR'}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
