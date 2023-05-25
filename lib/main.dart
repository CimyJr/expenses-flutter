import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final _transaction = {
    Transaction(
      id: 't1',
      title: 'Novo Tênis de Corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de Luz',
      value: 211.30,
      date: DateTime.now(),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Despesas Pessoais'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
            child: Card(
              color: Colors.deepPurple,
              elevation: 5,
              child: Text(
                'Gráfico',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Column(
            children: _transaction.map((tr) {
              return Container(
                constraints: const BoxConstraints(minHeight: 80),
                child: Card(
                  child: Row(children: [
                    Container(
                      // alignment: Alignment.,
                      width: 100,
                      height: 50,
                      child: Card(
                        color: Color.fromARGB(255, 116, 116, 116),
                        child: Center(
                          child: Text(
                            'R\$ ${tr.value.toStringAsFixed(2)}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 90),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(tr.title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        Text(DateFormat('d MMM y').format(tr.date)),
                      ],
                    )
                  ]),
                ),
              );
            }).toList(),
          ),
          const Card(
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Titulo'),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Valor(R\$)'),
                  ),
                  ElevatedButton(
                    onPressed: null,
                    child: Text('Nova Transação'),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
