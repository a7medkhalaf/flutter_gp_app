import 'package:flutter/material.dart';
import 'package:flutter_gp_app/models/diary_entry.dart';
import 'package:flutter_gp_app/providers/diary_entry_provider.dart';
import 'package:flutter_gp_app/screens/add_edit_diary_screen.dart';
import 'package:flutter_gp_app/widgets/constants.dart';
import 'package:flutter_gp_app/widgets/diary_date.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class DiaryListItem extends StatelessWidget {
  final DiaryEntry diary;
  const DiaryListItem(this.diary, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) => Provider.of<DiaryEntryProvider>(
          context,
          listen: false,
        ).removeDiaryEntry(diary.id),
        confirmDismiss: (direction) {
          return showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Delete'),
              content: const Text(
                'Are you sure you want to remove this diary ?',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const Text(
                    'Delete',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          );
        },
        background: Container(
          color: Theme.of(context).colorScheme.error,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 16),
          child: const Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
        child: ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(
                AddEditDiaryScreen.routeName,
                arguments: diary,
              );
            },
            title: Text(
              diary.title,
            ),
            subtitle: Text(
              diary.contentPlainText,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
            leading: DiaryDate(diary.date),
            trailing: diary.getEmotion()),
      ),
    );
  }
}
