import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gp_app/bloc/diary_bloc.dart';
import 'package:flutter_gp_app/data/models/diary_entry.dart';
import 'package:flutter_gp_app/data/models/emotion.dart';
import 'package:flutter_gp_app/data/provider/emotion_provider.dart';
import 'package:flutter_gp_app/presentation/widgets/custom_quill_editor.dart';
import 'package:flutter_quill/flutter_quill.dart';

class AddEditDiaryScreen extends StatefulWidget {
  static var routeName = '/add_edit_diary';

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
            onPressed: () async {
              final DiaryEntry newDiary;
              final emotion =
                  await classify(_quillController.document.toPlainText());
              if (diaryEntry == null) {
                newDiary = DiaryEntry.create(
                  _titleController.text,
                  _quillController.document,
                  Emotion.fromEnum(emotion),
                );
              } else {
                newDiary = diaryEntry.copyWith(
                  title: _titleController.text,
                  contentPlainText: _quillController.document.toPlainText(),
                  contentDelta: jsonEncode(_quillController.document.toDelta()),
                  emotion: Emotion.fromEnum(emotion),
                );
              }

              BlocProvider.of<DiaryBloc>(context).add(
                diaryEntry == null
                    ? DiaryInsert(newDiary)
                    : DiaryUpdate(newDiary),
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
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
              decoration: const InputDecoration(
                hintText: 'Title',
                // border: OutlineInputBorder(),
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
