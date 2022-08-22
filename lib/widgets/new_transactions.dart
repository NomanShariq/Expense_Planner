import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:core';

class NewTransactions extends StatefulWidget {
  final Function addTx;
  NewTransactions(
    this.addTx,
  );

  @override
  State<NewTransactions> createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final _titlecontroller = TextEditingController();
  final _amountcontroller = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    final enteredTitle = _titlecontroller.text;
    final enteredAmount = double.parse(_amountcontroller.text);

    widget.addTx(enteredTitle, enteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: "Title"),
              controller: _titlecontroller,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
                decoration: const InputDecoration(labelText: "Amount"),
                controller: _amountcontroller,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData()),
            const SizedBox(
              height: 20.0,
            ),
            Row(children: <Widget>[
              Text(
                _selectedDate == null
                    ? 'No Date Choosen'
                    : 'Date Picked ${DateFormat.yMd().format(_selectedDate)}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 20.0,
              ),
              ElevatedButton(
                onPressed: () {
                  _presentDatePicker();
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: const Text(
                  "Choose Date",
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ),
            ]),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                _submitData();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              child: const Text(
                "Add Transaction",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
