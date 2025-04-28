import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  final _transactions = [
    Transaction(id: 't1', title: 'Novo tênis de corrida', value: 310.79, date: DateTime.now()),
    Transaction(id: 't2', title: 'Conta de luz', value: 110.09, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Despesas Pessoais"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Card(
              elevation: 5,
              color: Colors.blue[300],
              child: Text(
              'Gráfico',
              textAlign: TextAlign.center),
            ),
          ),
          Column(
            children: _transactions.map((tr) {
              return Card(
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        tr.value.toString(),
                      ),
                    ),
                    Column(
                      children: [
                        Text(tr.title),
                        Text(tr.date.toString()),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
