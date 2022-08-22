import 'package:expense_planner/widgets/Chart.dart';
import 'package:expense_planner/widgets/new_transactions.dart';
import 'package:expense_planner/widgets/transactions_list.dart';
import 'package:flutter/material.dart';
import 'models/transactions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transaction',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Raleway',
        primarySwatch: Colors.green,
        primaryColor: Colors.white,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // late String titleInput;
  final titlecontroller = TextEditingController();
  final amountcontroller = TextEditingController();

  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 'T1',
    //   title: 'New Shoes',
    //   amount: 44.49,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 'T2',
    //   title: 'Groceries',
    //   amount: 14.49,
    //   date: DateTime.now(),
    // )
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return DateTime.now().isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  void _addNewTransactions(String title, double amount, DateTime chosendate) {
    final newTx = Transaction(
        title: title,
        amount: amount,
        date: chosendate,
        id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransactions(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransactions(_addNewTransactions),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteTransactions(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transactions app"),
        actions: <Widget>[
          IconButton(
            padding: const EdgeInsets.only(right: 20),
            icon: const Icon(
              Icons.add,
              color: Colors.white,
              size: 27,
            ),
            onPressed: () => _startAddNewTransactions(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionsList(_userTransactions,_deleteTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransactions(context),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
