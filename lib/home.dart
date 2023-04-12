import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class DoubleInputWithPercentageList extends StatefulWidget {
  @override
  _DoubleInputWithPercentageListState createState() =>
      _DoubleInputWithPercentageListState();
}

class _DoubleInputWithPercentageListState
    extends State<DoubleInputWithPercentageList> {
  double userInput = 0.0;
  int percentageValue = 0;

  List<double> percentageValues = List.generate(100, (index) => (index + 1));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: "Enter Amount",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  userInput = double.tryParse(value) ?? 0.0;
                });
              },
            ),
          ),
          const SizedBox(height: 24.0),
          SizedBox(
            height: 100.0,
            child: NumberPicker(
                    value: percentageValue,
                    minValue: 0,
                    maxValue: 100,
                    onChanged: (value) =>
                        setState(() => percentageValue = value),
                  ),
          ),
          const SizedBox(height: 26.0),
          Text(
            "Amount: ${userInput}\n${percentageValue}% Tip\nTotal amount: ${(userInput + (userInput * percentageValue/100)).toStringAsFixed(2)}",
            style: const TextStyle(fontSize: 24.0),
          ),
        ],
      ),
    );
  }
}
