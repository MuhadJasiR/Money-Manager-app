// ignore_for_file: unused_local_variable, prefer_const_constructors, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:money_manager_app/db/category_db.dart';
import 'package:money_manager_app/models/category_modal.dart';

class IncomePageScreen extends StatelessWidget {
  const IncomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ValueListenableBuilder(
          valueListenable: CategoryDB().incomeCategoryListListener,
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
                      color: Colors.blue[200],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 120),
                          child: IconButton(
                              onPressed: () {
                                CategoryDB.instance.deleteCategoty(category.id);
                              },
                              icon: Icon(
                                Icons.dangerous_outlined,
                                color: Colors.red,
                                size: 20,
                              )),
                        ),
                        Text(
                          category.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255)),
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
          }),
    );
  }
}
