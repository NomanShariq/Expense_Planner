import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  const ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          child:
              FittedBox(child: Text("\$${spendingAmount.toStringAsFixed(0)}")),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  border: Border.all(color: Colors.black, width: 1.0),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                  heightFactor: spendingPctOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 95, 180, 245),
                        borderRadius: BorderRadius.circular(20)),
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(label),
      ],
    );
  }
}
