// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:money_manager_app/db/category_db.dart';
import 'package:money_manager_app/models/category_modal.dart';

ValueNotifier<CategoryType> selectedCategoryNotifier =
    ValueNotifier(CategoryType.income);

Future<void> showCategoryAddPopup(BuildContext context) async {
  final _nameEditingController = TextEditingController();
  showDialog(
      context: context,
      builder: (ctx) {
        return SimpleDialog(
          title: const Text("Add Category"),
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: _nameEditingController,
                decoration: const InputDecoration(
                  hintText: "Select Category",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    RadioButton(title: "income", type: CategoryType.income),
                    RadioButton(title: "Expense", type: CategoryType.expense),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  final _name = _nameEditingController.text.trim();
                  validator:
                  (_name) {
                    if (_name == null || _name.isEmpty) {
                      return "Catergory required";
                    } else {
                      return null;
                    }
                  };

                  final _type = selectedCategoryNotifier.value;
                  final _category = CategoryModel(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      name: _name,
                      type: _type);
                  CategoryDB().insertCategory(_category);
                  Navigator.of(ctx).pop();
                },
                child: const Text("Add"),
              ),
            )
          ],
        );
      });
}

// ignore: must_be_immutable
class RadioButton extends StatelessWidget {
  final String title;
  final CategoryType type;
  // final CategoryType selectedtype;
  RadioButton({
    super.key,
    required this.title,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
            valueListenable: selectedCategoryNotifier,
            builder: (BuildContext ctx, CategoryType newCategory, Widget? _) {
              return Radio<CategoryType>(
                  value: type,
                  groupValue: selectedCategoryNotifier.value,
                  onChanged: (value) {
                    if (value == null) {
                      return null;
                    }
                    selectedCategoryNotifier.value = value;
                    selectedCategoryNotifier.notifyListeners();
                  });
            }),
        Text(title),
      ],
    );
  }
}
