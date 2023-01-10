import 'package:flutter/material.dart';

List<Widget> transactionType = <Widget>[Text("INCOME"), Text("EXPENSE")];

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  _myFormState() {
    _selectedVal = _catogariesList[0];
  }

  List<bool> _selectTranscationType = <bool>[false, false];
  bool vertical = false;
  final _catogariesList = [
    'salary',
    'Commission',
    'Rental',
    'Freelance',
    'Investment',
    'Other'
  ];
  String? _selectedVal = "Select Categories";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 45, 35, 255),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60))),
              child: Padding(
                padding: const EdgeInsets.only(left: 120, top: 50),
                child: Text(
                  "Add Transaction",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            Positioned(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Container(
                    decoration: BoxDecoration(),
                    height: 550,
                    width: double.infinity,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Transaction type",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 128, 128, 128)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 70),
                                child: ToggleButtons(
                                  direction: vertical
                                      ? Axis.vertical
                                      : Axis.horizontal,
                                  onPressed: (int index) {
                                    setState(() {
                                      for (int i = 0;
                                          i < _selectTranscationType.length;
                                          i++) {
                                        _selectTranscationType[i] = i == index;
                                      }
                                    });
                                  },
                                  color: Color.fromARGB(255, 128, 128, 128),
                                  borderColor: Color.fromARGB(255, 45, 35, 255),
                                  borderRadius: BorderRadius.circular(25),
                                  selectedBorderColor:
                                      Color.fromARGB(255, 35, 43, 255),
                                  selectedColor: Colors.white,
                                  fillColor: Color.fromARGB(255, 35, 43, 255),
                                  constraints: BoxConstraints(
                                      minHeight: 30, minWidth: 85),
                                  children: transactionType,
                                  isSelected: _selectTranscationType,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Amount",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 128, 128, 128)),
                              ),
                              SizedBox(height: 15),
                              Container(
                                height: 40,
                                width: 350,
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "Enter Amount",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      filled: true),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Categories",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 128, 128, 128)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 40,
                                child: DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                  value: null,
                                  items: _catogariesList.map(
                                    (e) {
                                      return DropdownMenuItem(
                                        child: Text(e),
                                        value: e,
                                      );
                                    },
                                  ).toList(),
                                  onChanged: (val) {
                                    setState(() {
                                      _selectedVal = val as String;
                                    });
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
