import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  //Step 1 change to stateful widget...
  late final Function addTrx;

  NewTransaction(this.addTrx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  //Define the variable for handling changes to a TextField....
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  late DateTime _selectedDate = DateTime.now();

  //2 Add method/function submitData()...
  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    //To verify the data entry..
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      print('#Debug2 - Passing 2..');
      return;
    }

    widget.addTrx(
        //Step 2) Addin widget for addTrx..
        enteredTitle, //Replace with variable..
        enteredAmount, //Replace with variable..
        _selectedDate);
    // 3) Adding Navigator to automatically close the Modal Bottom Sheet (dialog box) after user key-in the new record...

    Navigator.of(context).pop();

    print('#Debug2 - Passing 1..');
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      print(
          "-----------------------------------------------\nDate: $pickedDate\n-----------------------------------------------\n");

      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
                onSubmitted: (_) => submitData(),
                //onChanged: (val) => { titleInput = val},   // Note: 1st approach
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
                keyboardType: TextInputType.number, //1) Adding keyboardType
                onSubmitted: (_) => submitData(),
                //onChanged: (val) => { amountInput = val},
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(_selectedDate == null
                          ? 'No Date Chosen'
                          : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}'),
                    ),
                    TextButton(
                        onPressed: _presentDatePicker,
                        child: Text(
                          "Choose Date",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Theme.of(context).splashColor,
                ),
                onPressed: () {
                  print(titleController);
                  print(amountController);
                  submitData(); //Adding function to Button...

                  /*addTrx(
                    titleController.text,
                    double.parse(amountController.text),
                  ); */
                },
                child: Text('Add Transaction'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
