import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class CustomQuillTollbar extends StatelessWidget {
  final QuillController controller;
  const CustomQuillTollbar(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return QuillToolbar(
      configurations: const QuillToolbarConfigurations(),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            // IconButton(
            //   onPressed: () => context

            //   icon: const Icon(
            //     Icons.width_normal,
            //   ),
            // ),
            QuillToolbarHistoryButton(
              isUndo: true,
              controller: controller,
            ),
            QuillToolbarHistoryButton(
              isUndo: false,
              controller: controller,
            ),
            QuillToolbarToggleStyleButton(
              options: const QuillToolbarToggleStyleButtonOptions(),
              controller: controller,
              attribute: Attribute.bold,
            ),
            QuillToolbarToggleStyleButton(
              options: const QuillToolbarToggleStyleButtonOptions(),
              controller: controller,
              attribute: Attribute.italic,
            ),
            QuillToolbarToggleStyleButton(
              controller: controller,
              attribute: Attribute.underline,
            ),
            QuillToolbarClearFormatButton(
              controller: controller,
            ),
            const VerticalDivider(),
            // QuillToolbarImageButton(
            //   controller: controller,
            // ),
            // QuillToolbarCameraButton(
            //   controller: controller,
            // ),
            // QuillToolbarVideoButton(
            //   controller: controller,
            // ),
            const VerticalDivider(),
            QuillToolbarColorButton(
              controller: controller,
              isBackground: false,
            ),
            QuillToolbarColorButton(
              controller: controller,
              isBackground: true,
            ),
            const VerticalDivider(),
            // QuillToolbarSelectHeaderStyleButton(
            //   controller: controller,
            // ),
            const VerticalDivider(),
            QuillToolbarToggleCheckListButton(
              controller: controller,
            ),
            QuillToolbarToggleStyleButton(
              controller: controller,
              attribute: Attribute.ol,
            ),
            QuillToolbarToggleStyleButton(
              controller: controller,
              attribute: Attribute.ul,
            ),
            QuillToolbarToggleStyleButton(
              controller: controller,
              attribute: Attribute.inlineCode,
            ),
            QuillToolbarToggleStyleButton(
              controller: controller,
              attribute: Attribute.blockQuote,
            ),
            QuillToolbarIndentButton(
              controller: controller,
              isIncrease: true,
            ),
            QuillToolbarIndentButton(
              controller: controller,
              isIncrease: false,
            ),
            const VerticalDivider(),
            QuillToolbarLinkStyleButton(controller: controller),
          ],
        ),
      ),
    );
  }
}
