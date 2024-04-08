import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_gp_app/models/diary_entry.dart';
import 'package:flutter_gp_app/database/diary_entry_provider.dart';
import 'package:flutter_gp_app/widgets/custom_quill_editor.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:provider/provider.dart';

class AddEditDiaryScreen extends StatefulWidget {
  static var routeName = 'add_edit_diary';

  const AddEditDiaryScreen({super.key});

  @override
  State<AddEditDiaryScreen> createState() => _AddEditDiaryScreenState();
}

class _AddEditDiaryScreenState extends State<AddEditDiaryScreen> {
  final _titleController = TextEditingController();
  final _quillController = QuillController.basic();

  Future<void> _loadDiaryEntry() async {
    final diaryEntry =
        ModalRoute.of(context)!.settings.arguments as DiaryEntry?;
    if (diaryEntry != null) {
      _titleController.text = diaryEntry.title;
      try {
        _quillController.document = Document.fromJson(
          jsonDecode(diaryEntry.contentDelta),
        );
      } catch (e) {
        log(e.toString());
      }
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadDiaryEntry();
    });
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _quillController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final diaryProvider = Provider.of<DiaryEntryProvider>(
      context,
      listen: false,
    );

    final diaryEntry =
        ModalRoute.of(context)!.settings.arguments as DiaryEntry?;

    return Scaffold(
      appBar: AppBar(
        title: diaryEntry == null
            ? const Text('Add Diary Entry')
            : const Text('Edit Diary Entry'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              diaryProvider.addUpdateDiaryEntry(
                id: diaryEntry?.id,
                title: _titleController.text,
                contentDelta: jsonEncode(
                  _quillController.document.toDelta().toJson(),
                ),
                contentPlainText: _quillController.document.toPlainText(),
                date: diaryEntry == null ? DateTime.now() : diaryEntry.date,
                emotion: diaryEntry?.emotion ?? Emotion.neutral,
              );
              Navigator.of(context).pop();
            },
            child: const Text('Save'),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                hintText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: CustomQuillEditor(_quillController),
          ),
        ],
      ),
    );
  }
}
