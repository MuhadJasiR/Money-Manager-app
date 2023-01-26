// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:money_manager_app/db/category_db.dart';
import 'package:money_manager_app/models/category_modal.dart';

class ExpenseScreenPage extends StatelessWidget {
  const ExpenseScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ValueListenableBuilder(
        valueListenable: CategoryDB().expenseCategoryListListener,
        builder: (BuildContext ctx, List<CategoryModel> newList, Widget? _) {
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: (2 / 1.3),
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              itemCount: newList.length,
              itemBuilder: ((context, index) {
                final category = newList[index];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.teal[200],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 140,
                        ),
                        child: IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: ((context) {
                                    return AlertDialog(
                                      content:
                                          const Text("Do you want to delete"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text("No")),
                                        TextButton(
                                            onPressed: () {
                                              CategoryDB.instance
                                                  .deleteCategoty(category.id);
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text("yes")),
                                      ],
                                    );
                                  }));
                            },
                            icon: const Icon(
                              Icons.dangerous_sharp,
                              color: Colors.red,
                              size: 20,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 11),
                        child: Text(
                          category.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                    ],
                  ),
                  height: 20,
                  width: 40,
                  // child: Card(
                  //   color: Color.fromARGB(255, 45, 35, 255),
                  // ),
                );
              }));
        },
      ),
    );
  }
}
