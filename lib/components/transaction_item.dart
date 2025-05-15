import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import '../models/transaction.dart';


class TransactionItem extends StatelessWidget {

  final Transaction tr;
  final void Function(String p1) onRemove;

  const TransactionItem({
    super.key,
    required this.tr,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(child: Text('R\$${tr.value}')),
          ),
        ),
        title: Text(
          tr.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(
          DateFormat('d MMM yy').format(tr.date)
        ),
        trailing: MediaQuery.of(context).size.width >  480
          ? TextButton.icon(
            onPressed: () => onRemove(tr.id),
            icon: Icon(Icons.delete), 
            label: Text('Excluir'),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.error),
            )
          )
          : IconButton(
            onPressed: () => onRemove(tr.id),
            icon: Icon(Icons.delete),
            color: Theme.of(context).colorScheme.error,
        ),
      ),
    );
  }
}