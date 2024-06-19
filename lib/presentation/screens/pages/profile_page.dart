import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: const Text('Hello, Khalaf!'),
          centerTitle: false,
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Card(
                child: ListTile(
                  title: const Text(
                    'Nickname',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text('Khalaf'),
                  leading: const Icon(Icons.person),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Change Nickname'),
                          content: const TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter new nickname',
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'Cancel',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Save'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text(
                    'Test',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: const Icon(Icons.email),
                  onTap: () async {
                    final Directory? d = await getExternalStorageDirectory();
                    final Directory? d2 =
                        await getApplicationDocumentsDirectory();
                    log('External Storage Directory: $d');
                    log('Application Documents Directory: $d2');
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
