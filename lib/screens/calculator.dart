import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController fieldOneController = TextEditingController();
  TextEditingController fieldTwoController = TextEditingController();
  TextEditingController fieldThreeController = TextEditingController();

  double a = 0;
  double b = 0;
  double c = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTextField("Enter first value", fieldOneController),
              _buildTextField("Enter second value", fieldTwoController),
              _buildTextField("Result", fieldThreeController),
              SizedBox(height: 20),
              _buildRowOfButtons(),
              SizedBox(height: 20),
              _buildClearButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: labelText,
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }

  Widget _buildRowOfButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildOperatorButton("+"),
        _buildOperatorButton("-"),
        _buildOperatorButton("x"),
        _buildOperatorButton("÷"),
      ],
    );
  }

  Widget _buildOperatorButton(String operator) {
    return Container(
      width: 60,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          _performOperation(operator);
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.blue[400],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: Text(
          operator,
          style: TextStyle(
            fontSize: 28,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildClearButton() {
    return Container(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          _clearFields();
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: Text(
          "Clear",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void _performOperation(String operator) {
    setState(() {
      a = double.parse(fieldOneController.text);
      b = double.parse(fieldTwoController.text);

      switch (operator) {
        case "+":
          c = a + b;
          break;
        case "-":
          c = a - b;
          break;
        case "x":
          c = a * b;
          break;
        case "÷":
          c = a / b;
          break;
      }

      fieldThreeController.text = c.toString();
    });
  }

  void _clearFields() {
    setState(() {
      fieldOneController.text = "";
      fieldTwoController.text = "";
      fieldThreeController.text = "";
    });
  }
}
