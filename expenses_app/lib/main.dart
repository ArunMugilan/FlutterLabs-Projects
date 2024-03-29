/*------------------------------------------------------------------------------------------------------
  Author : MNor
  Date Modified : 24 Sept 2023
  Changes : 1) Disable Debug Flag at MaterialApp
            2) Add new theme for Elevated button
            3) Add additional parameter for chosenDate in function _addNewTransaction()
            4) Add _deleteTransaction(String id) method for deleting a record.
            5) Passing parameter _deleteTransaction to TransactionList widget.
            6) Assign AppBar widget to appBar variable -> To determine the height of AppBar.
            7) Wrap Chart() and TransactionList() widget with Container widget with allocation of
               30% and 70% using MediaQuery.
            8) Disable landscape mode for temporary.
            9) Enable landscape mode.
            10) Add Switch widget to control the appearance of ChartBar
            11) Change space allocation for Chart widget from 30% to 70%
            12) To display different contents based on device orientation.
            13) Change back Container height for Chart widget as 0.3 (initially as 0.7)
            14) Managing the MediaQuery object -> Assign to specific variable to improve app
                performance.
            15) Checking the device platform either iOS or not? Use Platform.isIOS
            16) Adding the Cuprtino widgets for iOS platform. Apply for CupertinoPageScaffold &
                CupertinoNavigationBar
------------------------------------------------------------------------------------------------------*/
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './widget/new_transaction.dart';
import './widget/transaction_list.dart';
import './widget/chart.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Planner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        //  accentColor: Colors.amber,
        splashColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          bodyText1: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          bodyText2: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 15,
            color: Colors.red,
          ),
        ),
        //20 Nov 2023 -  Add new theme for Elevated button
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        )),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // Change to Stateful widget
  // String titleInput;
  // String amountInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Move existing records in Transaction in here...
  final List<Transaction> _userTransactions = [
    /*  Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ), */
  ];

  bool _showChart = false; // Defined the flag as false.

  //Step 2) Method use to Create a List to get recent 7 days of transactions
  List<Transaction> get _recentTransaction {
    return _userTransactions.where((trx) {
      return trx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  //Add _addNewTransaction to cater for new record when user click
  //either at AppBar button or Floating Action Button
  void _addNewTransaction(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      //date: DateTime.now(),
      date: chosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx); // To retain the current records..
    });
  }

  //This is the method/function to render the Modal Bottom Sheet...
  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {}, // Call new_transaction.dart
          behavior: HitTestBehavior.opaque,
          child: NewTransaction(_addNewTransaction),
        );
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((trx) => trx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    // final appBar = AppBar(
    //   title: Text('Expense Planner'),
    //   centerTitle: true,
    //   actions: [
    //     IconButton(
    //       onPressed: () =>
    //           _startAddNewTransaction(context), //Assign  Modal Bottom Sheet
    //       icon: Icon(Icons.add),
    //     ),
    //   ],
    // );

    //16) Adding cupertino widgets...
    final PreferredSizeWidget appBar = (Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text('Expense Planner'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  child: Icon(CupertinoIcons.add),
                  onTap: () => _startAddNewTransaction(context),
                )
              ],
            ),
          )
        : AppBar(
            title: Text('Expense Planner'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => _startAddNewTransaction(context),
              ),
            ],
          )) as PreferredSizeWidget;

    final trxListWidget = Container(
      height: (mediaQuery.size.height -
              appBar.preferredSize.height -
              mediaQuery.padding.top) *
          0.7,
      child: TransactionList(_userTransactions, _deleteTransaction),
    );

    //For 16)
    final pageBody = SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          if (isLandscape)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Show Chart'),
                Switch(
                    value: _showChart,
                    onChanged: (val) {
                      setState(() {
                        _showChart = val;
                      });
                    }),
              ],
            ),
          if (!isLandscape)
            Container(
              height: (mediaQuery.size.height -
                      appBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.3,
              child: Chart(_recentTransaction),
            ),
          if (!isLandscape) trxListWidget,
          if (isLandscape)
            _showChart
                ? Container(
                    height: (mediaQuery.size.height -
                            appBar.preferredSize.height -
                            mediaQuery.padding.top) *
                        0.7,
                    child: Chart(_recentTransaction),
                  )
                : trxListWidget
        ],
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: pageBody,
            //  navigationBar: appBar,
            navigationBar: CupertinoNavigationBar(
              middle: Text('Expense Planner'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  GestureDetector(
                    child: Icon(CupertinoIcons.add),
                    onTap: () => _startAddNewTransaction(context),
                  )
                ],
              ),
            ),
          )
        : Scaffold(
            appBar: appBar,
            body: pageBody,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    onPressed: () =>
                        _startAddNewTransaction(context), // Modal Bottom Sheet
                    child: Icon(Icons.add),
                  ),
          );
  }
}
