import 'package:flutter/material.dart';

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
              onTap: () {},
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
