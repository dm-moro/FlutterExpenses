import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import '../models/transaction.dart';


class TransactionItem extends StatefulWidget {

  final Transaction tr;
  final void Function(String p1) onRemove;

  const TransactionItem({
    super.key,
    required this.tr,
    required this.onRemove,
  });

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

  class _TransactionItemState extends State<TransactionItem> {

   static const colors = [
    Colors.red,
    Colors.purple,
    Colors.orange,
    Colors.blue
  ];

  late Color _backgroundColor;

  @override
  void initState() {
    super.initState();
    int i = Random().nextInt(4);
    _backgroundColor = colors[i];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _backgroundColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(child: Text('R\$${widget.tr.value}')),
          ),
        ),
        title: Text(
          widget.tr.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(
          DateFormat('d MMM yy').format(widget.tr.date)
        ),
        trailing: MediaQuery.of(context).size.width >  480
          ? TextButton.icon(
            onPressed: () => widget.onRemove(widget.tr.id),
            icon: const Icon(Icons.delete), 
            label: const Text('Excluir'),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.error),
            )
          )
          : IconButton(
            onPressed: () => widget.onRemove(widget.tr.id),
            icon: const Icon(Icons.delete),
            color: Theme.of(context).colorScheme.error,
        ),
      ),
    );
  }
}