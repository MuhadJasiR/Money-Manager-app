// ignore_for_file: prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';
import 'package:money_manager_app/db/category_db.dart';
import 'package:money_manager_app/db/transacrtion_model.dart';
import 'package:money_manager_app/models/category_modal.dart';

List<Widget> transactionType = <Widget>[Text("INCOME"), Text("EXPENSE")];

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  DateTime? _selectedDate;
  CategoryType? _selectedCategoryType;
  CategoryModel? _selectedCategoryModel;
  final _notesTextEditingController = TextEditingController();
  final _amountTextEditingController = TextEditingController();
  // ignore: prefer_typing_uninitialized_variables
  var selectedType;
  String? _categoryId;

  @override
  void initState() {
    _selectedCategoryType = CategoryType.income;
    super.initState();
  }

  final List<bool> _selectTranscationType = <bool>[false, false];
  bool vertical = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                      elevation: 5,
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
                                height: 15,
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
                                        selectedType = index;
                                        _categoryId = null;
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
                              SizedBox(height: 20),
                              Container(
                                height: 40,
                                width: 350,
                                child: TextField(
                                  controller: _amountTextEditingController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      hintText: "Enter Amount",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      filled: true),
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "Categories",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 128, 128, 128)),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                height: 40,
                                child: DropdownButton(
                                    hint: Text(
                                        "                       Select Category                      "),
                                    value: _categoryId,
                                    items: (selectedType == 0
                                            ? CategoryDB()
                                                .incomeCategoryListListener
                                            : CategoryDB()
                                                .expenseCategoryListListener)
                                        .value
                                        .map((e) {
                                      return DropdownMenuItem(
                                        value: e.id,
                                        child: Text(e.name),
                                        onTap: () {
                                          _selectedCategoryModel = e;
                                        },
                                      );
                                    }).toList(),
                                    onChanged: (selectedValue) {
                                      print(selectedValue);
                                      setState(() {
                                        _categoryId = selectedValue;
                                      });
                                    }),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "Notes",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 128, 128, 128)),
                              ),
                              SizedBox(height: 20),
                              Container(
                                height: 40,
                                width: 350,
                                child: TextField(
                                  controller: _notesTextEditingController,
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      hintText: "Enter Notes",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      filled: true),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 100),
                                child: TextButton.icon(
                                    onPressed: () async {
                                      final selectedDateTemp =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now()
                                            .subtract(const Duration(days: 30)),
                                        lastDate: DateTime.now(),
                                      );
                                      if (selectedDateTemp == null) {
                                        return;
                                      } else {
                                        setState(() {
                                          _selectedDate = selectedDateTemp;
                                        });
                                      }
                                    },
                                    icon: Icon(Icons.calendar_today),
                                    label: Text(_selectedDate == null
                                        ? "Select Date"
                                        : _selectedDate!.toString())),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: 500,
                                child: ElevatedButton(
                                    onPressed: () {
                                      addTransaction();
                                    },
                                    child: Text("Add")),
                              ),
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

  Future<void> addTransaction() async {
    final notesText = _notesTextEditingController.text;
    final amountText = _amountTextEditingController.text;

    if (notesText.isEmpty) {
      return;
    }
    if (amountText.isEmpty) {
      return;
    }
    if (_selectedDate == null) {
      return;
    }
    final parseAmount = double.tryParse(amountText);
    if (parseAmount == null) {
      return;
    }
    if (_selectedCategoryModel == null) {
      return;
    }
    final _model = TransactionModel(
      notes: notesText,
      amount: parseAmount,
      date: _selectedDate!,
      type: selectedType,
      category: _selectedCategoryModel!,
    );
  }
}
