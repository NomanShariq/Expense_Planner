import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:expense_planner/models/transactions.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  const TransactionsList(
    this.transactions,
    this.deleteTx,
  ) : super(key: null);

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
                const SizedBox(
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
                  margin: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  child: ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.all(6),
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
                          const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        deleteTx(transactions[index].id);
                      },
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
