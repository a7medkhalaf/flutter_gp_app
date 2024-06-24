import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gp_app/bloc/diary_bloc.dart';

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
        Wrap(
          children: [
            Card(
              margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: ListTile(
                title: const Text(
                  'Nickname',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Khalaf'),
                leading: const Icon(
                  Icons.person,
                  color: Colors.orange,
                ),
                shape: ShapeBorder.lerp(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  0.5,
                ),
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
                              // show snackbar with success message
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Nickname updated!'),
                                ),
                              );
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
            const Divider(
              indent: 64,
              endIndent: 64,
            ),
            Card(
              margin: const EdgeInsets.only(
                  left: 16, right: 16, bottom: 16, top: 16),
              child: ListTile(
                title: const Text(
                  'Backup',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: const Icon(
                  Icons.backup,
                  color: Colors.blue,
                ),
                shape: ShapeBorder.lerp(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  0.5,
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Backup Data'),
                        content: const Text('Do you want to backup your data?'),
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
                              BlocProvider.of<DiaryBloc>(context)
                                  .add(DiaryBackup());
                              Navigator.of(context).pop();
                              // show snackbar with success message
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Data backed up!'),
                                ),
                              );
                            },
                            child: const Text('Backup'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
            Card(
              margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: ListTile(
                title: const Text(
                  'Restore',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: const Icon(
                  Icons.restore,
                  color: Colors.green,
                ),
                shape: ShapeBorder.lerp(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  0.5,
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Restore Data'),
                        content:
                            const Text('Do you want to restore your data?'),
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
                              BlocProvider.of<DiaryBloc>(context)
                                  .add(DiaryRestore());
                              Navigator.of(context).pop();
                              // show snackbar with success message
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Data restored!'),
                                ),
                              );
                            },
                            child: const Text('Restore'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
            const Divider(
              indent: 64,
              endIndent: 64,
            ),
            Card(
              margin: const EdgeInsets.only(
                  left: 16, right: 16, bottom: 16, top: 16),
              child: ListTile(
                title: const Text(
                  'Reset',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: const Icon(
                  Icons.report_gmailerrorred_rounded,
                  color: Colors.red,
                ),
                shape: ShapeBorder.lerp(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  0.5,
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Reset Data'),
                        content: const Text('Do you want to reset your data?'),
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
                              BlocProvider.of<DiaryBloc>(context)
                                  .add(DiaryReset());
                              Navigator.of(context).pop();
                              // show snackbar with success message
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Data reset!'),
                                ),
                              );
                            },
                            child: const Text('Reset'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
