import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expense_planner/models/transactions.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionsList(
    this.transactions,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: [
                const Text(
                  "No TransactionsList",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 40,
                ),
                Image.asset(
                  "zzz.png",
                  height: 200,
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 6,
                  margin: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  child: ListTile(
                    leading: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                        child: CircleAvatar(
                          radius: 30,
                          child: Text(
                            "\$${transactions[index].amount}",
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
