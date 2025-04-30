import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import '../components/transaction_user.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Despesas Pessoais"),
      ),
      body: SingleChildScrollView(
        child: Column(
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
            TransactionUser(),
          ],
        ),
      ),
    );
  }
}
