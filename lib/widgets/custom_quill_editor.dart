import 'package:flutter/material.dart';
import 'package:flutter_gp_app/widgets/custom_quill_toolbar.dart';
import 'package:flutter_quill/flutter_quill.dart';

class CustomQuillEditor extends StatelessWidget {
  final QuillController _controller;
  const CustomQuillEditor(this._controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Expanded(
            child: QuillEditor.basic(
              configurations: QuillEditorConfigurations(
                controller: _controller,
                readOnly: false,
                placeholder: 'Diary content',
              ),
            ),
          ),
          Container(
            color: Colors.black12,
            child: CustomQuillTollbar(_controller),
          ),
        ],
      ),
    );
  }
}
