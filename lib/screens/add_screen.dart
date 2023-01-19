// ignore_for_file: prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';
import 'package:money_manager_app/db/category_db.dart';
import 'package:money_manager_app/db/transacrtion_model.dart';
import 'package:money_manager_app/db/transaction_db.dart';
import 'package:money_manager_app/models/category_modal.dart';
import 'package:money_manager_app/widgets/category_add_popup.dart';

List<Widget> transactionType = <Widget>[Text("INCOME"), Text("EXPENSE")];
final List<bool> _selectTranscationType = <bool>[true, false];
bool vertical = false;

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
                              TextField(
                                controller: _amountTextEditingController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    isDense: true,
                                    fillColor: Colors.white,
                                    hintText: "Enter Amount",
                                    border: OutlineInputBorder(),
                                    filled: true),
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
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black54),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                            borderRadius:
                                                BorderRadius.circular(2),
                                            hint: Text(
                                                "                Select Category               "),
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
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          showCategoryAddPopup(context);
                                        },
                                        icon: Icon(
                                          Icons.add_box_outlined,
                                          color:
                                              Color.fromARGB(255, 35, 45, 255),
                                        ))
                                  ],
                                ),
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
                              SizedBox(height: 10),
                              TextField(
                                keyboardType: TextInputType.multiline,
                                controller: _notesTextEditingController,
                                decoration: InputDecoration(
                                    isDense: true,
                                    fillColor: Colors.white,
                                    hintText: "Enter Notes",
                                    border: OutlineInputBorder(),
                                    filled: true),
                              ),
                              SizedBox(
                                height: 20,
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
                                        : parseDate(_selectedDate!))),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 72),
                                child: Container(
                                  width: 180,
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)))),
                                      onPressed: () {
                                        addTransaction();
                                        print("added Transaction");
                                      },
                                      child: Text("Add")),
                                ),
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
    // ignore: unused_local_variable
    final model = TransactionModel(
      notes: notesText,
      amount: parseAmount,
      date: _selectedDate!,
      type: _selectedCategoryType!,
      category: _selectedCategoryModel!,
    );

    await TransactionDB.instance.addTransaction(model);
    Navigator.of(context).pop();
    TransactionDB.instance.refresh();
  }

  String parseDate(DateTime date) {
    return "${date.day}-${date.month}-${date.year}";
  }
}
