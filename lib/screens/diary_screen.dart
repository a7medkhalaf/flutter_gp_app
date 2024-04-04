import 'package:flutter/material.dart';
import 'package:flutter_gp_app/providers/diary_entry_provider.dart';
import 'package:flutter_gp_app/screens/add_edit_diary_screen.dart';
import 'package:flutter_gp_app/widgets/diary_list_view.dart';
import 'package:provider/provider.dart';

class DiaryScreen extends StatelessWidget {
  static var routeName = 'diary';

  const DiaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
        actions: [
          TextButton(
            child: const Text('Reset'),
            onPressed: () {
              Provider.of<DiaryEntryProvider>(
                context,
                listen: false,
              ).resetDiaryEntries();
            },
          ),
        ],
      ),
      body: const DiaryListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddEditDiaryScreen.routeName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
