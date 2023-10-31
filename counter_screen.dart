
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  double sliderValue = 0.3;
 var tip = 15.00;
  var total = 0.00;
  var billAmount = "0.0";
  @override
  Widget build(BuildContext context) {
return Scaffold(
  body: _buildMainWidget(context),
);

}

Widget _buildMainWidget(BuildContext context) {
  return Center(child: Column(
mainAxisSize: MainAxisSize.min,
children: [
  Text("Enter Bill amount"),
  TextField(
                onChanged: (value) => setState(() {
                  billAmount =value;
                  calculateTip(tip);
                })),Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
     ),
          Text("Select tip percentage"),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16)),
         Slider(
              value: tip,
              label: "${tip.round()}%",
              divisions: 10,
              min: 0.0,
              max: 30.0,
                activeColor: Colors.purple,
              onChanged: (value) => setState(() {
                tip = value;
                
                calculateTip(tip);
              })),
        Text("Tip PKR: ${tipAmount(tip)}"),
         const Padding(padding: EdgeInsets.only(bottom: 8.0)),
          Text("Total PKR: ${total.toStringAsFixed(2)}"),

])
);
}
void calculateTip(double tipAmount) {
    var bill = double.parse(billAmount);
    if (bill > 0) {
      tip = tipAmount;
      total = bill + (bill*tip)/100;
    }
  }

  String tipAmount(double tip) {
    var bill = double.parse(billAmount);
    if (bill > 0) {
     return "${(bill*tip)/100}";
    }
    return "0.0";
  }


}