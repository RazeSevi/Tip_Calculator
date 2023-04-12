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

          const SizedBox(height: 4.0),

          SizedBox(
            height: 100.0,
            child: NumberPicker(
              value: percentageValue,
              minValue: 0,
              maxValue: 100,
              onChanged: (value) => setState(() => percentageValue = value),
            ),
          ),
          const SizedBox(height: 4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () => setState(() {
                  final newValue = percentageValue - 1;
                  percentageValue = newValue.clamp(0, 100);
                }),
              ),
              Text.rich(
                      TextSpan(
                        text: "Current Tip: ",
                        style: const TextStyle(fontSize: 20),
                        children: <TextSpan>[
                          TextSpan(
                            text: percentageValue.toStringAsFixed(0),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 167, 123, 4),
                            ),
                          ),
                          const TextSpan(
                          text: '%',
                        ),
                        ],
                      ),
                    ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => setState(() {
                  final newValue = percentageValue + 1;
                  percentageValue = newValue.clamp(0, 100);
                }),
              ),
            ],
          ),

          const SizedBox(height: 5.0),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 1000.0,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: Text.rich(
                      TextSpan(
                        text: "Amount: ",
                        style: const TextStyle(fontSize: 24),
                        children: <TextSpan>[
                          TextSpan(
                            text: (userInput).toStringAsFixed(2),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 167, 123, 4),
                            ),

                          ),
                          const TextSpan(
                          text: '\$',
                        ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 1000.0,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: Text.rich(
                      TextSpan(
                        text: "Tip in \$: ",
                        style: const TextStyle(fontSize: 24),
                        children: <TextSpan>[
                          TextSpan(
                            text: ((userInput * percentageValue) / 100).toStringAsFixed(2),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 167, 123, 4),
                            ),
                          ),
                          const TextSpan(
                          text: '\$',
                        ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 1000.0,
                  child: Container(
                    decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: Text.rich(
                      TextSpan(
                        text: 'Total amount: ',
                        style: const TextStyle(fontSize: 24),
                        children: <TextSpan>[
                          TextSpan(
                            text: (userInput + (userInput * percentageValue / 100)).toStringAsFixed(2),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 167, 123, 4),
                            ),
                          ),
                          const TextSpan(
                          text: '\$',
                        ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
