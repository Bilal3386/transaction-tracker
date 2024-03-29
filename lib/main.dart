import 'package:flutter/material.dart';
import 'models/transaction.dart';
import 'widgets/new_transaction.dart';
import 'widgets/transaction_list.dart';


void main() => runApp(MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fluttered App",
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
            fontFamily: 'OPenSans',
           fontWeight: FontWeight.bold,
           fontSize: 20,
          //  billu
          // new feature change
          )
        ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            )
          )
         ) 
      ),
      home: MyHomePage(),
          );
        }
      }  
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
 final List<Transaction> _userTransaction = [
  Transaction(
     id: 't1',
     title: 'New Shoes',
     amount: 69.99,
      date: DateTime.now()
   ),
    Transaction(
     id: 't2',
     title: 'weekly Groceries',
     amount: 68.99,
      date: DateTime.now()
   )
];
void _addNewTransaction(String txTitle , double txAmount)
{
  final newTx = Transaction(
    title: txTitle,
    amount: txAmount,
    date: DateTime.now(),
    id: DateTime.now().toString(),
    );
    setState(() {
      _userTransaction.add(newTx);
    });
}
 void _startAddNewTransaction(BuildContext ctx){
   showModalBottomSheet(context: ctx, builder: (_) {
     return GestureDetector(
       onTap: (){},
       child: NewTransaction(_addNewTransaction),
       behavior: HitTestBehavior.opaque,
       );
   });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("Personal Expenses"),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
        )
      ],
    ),
    body: SingleChildScrollView(
      child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: 100,
              child: Card(
                color: Colors.blue,
                elevation: 5,
                child: Text('CHART')
              ),
            ),
              TransactionList(_userTransaction),
          ],
        ),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => _startAddNewTransaction(context),
    ),
    );
  }
}