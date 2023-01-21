import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:money_manager_app/db/transacrtion_model.dart';
import 'package:money_manager_app/models/category_modal.dart';
import 'package:money_manager_app/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.assignment_ind,
                color: Color.fromARGB(255, 45, 140, 255),
              ),
              title: const Text("Contact Me"),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.assignment_late_sharp,
                  color: Color.fromARGB(255, 45, 140, 255)),
              title: const Text("About"),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.privacy_tip,
                  color: Color.fromARGB(255, 45, 140, 255)),
              title: const Text("Privacy & policy"),
            ),
            ListTile(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: const Text("Are you sure to Reset"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("No")),
                          TextButton(
                              onPressed: () async {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                await prefs.clear();
                                SharedPreferences tectcontrol =
                                    await SharedPreferences.getInstance();
                                await tectcontrol.clear();
                                final transationDb =
                                    await Hive.openBox<TransactionModel>(
                                        'transaction-db');
                                final categorydb =
                                    await Hive.openBox<CategoryModel>(
                                        'category-database');

                                categorydb.clear();
                                transationDb.clear();
                                // ignore: use_build_context_synchronously
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => const SplashScreen(),
                                  ),
                                );
                              },
                              child: const Text("Yes"))
                        ],
                      );
                    });
              },
              leading: const Icon(Icons.restore_page_outlined,
                  color: Color.fromARGB(255, 45, 140, 255)),
              title: const Text("Reset app"),
            ),
          ],
        ),
      ),
    );
  }
}
