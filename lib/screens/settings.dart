import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:money_manager_app/db/transacrtion_model.dart';
import 'package:money_manager_app/models/category_modal.dart';
import 'package:money_manager_app/screens/settings_pages/about_page.dart';
import 'package:money_manager_app/screens/settings_pages/privacy_policy.dart';
import 'package:money_manager_app/screens/splash_screen.dart';
import 'package:share_plus/share_plus.dart';
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
            Card(
              child: ListTile(
                onTap: () {
                  Share.share(
                      'hey! check out this new app https://play.google.com/store/search?q=pub%3ADivTag&c=apps');
                },
                leading: const Icon(
                  Icons.share,
                  color: Color.fromARGB(255, 45, 140, 255),
                ),
                title: const Text("Share"),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const AboutScreen())));
                },
                leading: const Icon(Icons.assignment_late_sharp,
                    color: Color.fromARGB(255, 45, 140, 255)),
                title: const Text("About"),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return const PrivacyPolicyScreen();
                  })));
                },
                leading: const Icon(Icons.privacy_tip,
                    color: Color.fromARGB(255, 45, 140, 255)),
                title: const Text("Privacy & policy"),
              ),
            ),
            Card(
              child: ListTile(
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
                                  // SharedPreferences textControl =
                                  //     await SharedPreferences.getInstance();
                                  // await textControl.clear();
                                  final transactionDb =
                                      await Hive.openBox<TransactionModel>(
                                          'transaction-database');
                                  final categoryDb =
                                      await Hive.openBox<CategoryModel>(
                                          'category-database');

                                  categoryDb.clear();
                                  transactionDb.clear();
                                  // ignore: use_build_context_synchronously
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SplashScreen(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Yes",
                                  style: TextStyle(color: Colors.red),
                                ))
                          ],
                        );
                      });
                },
                leading: const Icon(Icons.restore_page_outlined,
                    color: Color.fromARGB(255, 45, 140, 255)),
                title: const Text("Reset app"),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 400),
              child: Text(
                "version 1.0.1",
                style: TextStyle(color: Colors.black38),
              ),
            )
          ],
        ),
      ),
    );
  }
}
