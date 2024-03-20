import 'package:flutter/material.dart';
import 'package:flutter_gp_app/providers/diary_entry_provider.dart';
import 'package:flutter_gp_app/widgets/diary_item.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DiaryListViewPerMonth extends StatelessWidget {
  final int monthIndex;
  const DiaryListViewPerMonth(this.monthIndex, {super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<DiaryEntryProvider>(
        context,
      ).diaryEntriesByMonth.then((value) => value[monthIndex]),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return snapshot.data!.isNotEmpty
              ? Column(
                  children: [
                    Text(
                      DateFormat.yMMMM()
                          .format(snapshot.data!.elementAt(0).date),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontStyle: FontStyle.italic),
                    ),
                    ListView.builder(
                      padding: const EdgeInsets.all(8),
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemBuilder: (context, j) {
                        return DiaryListItem(snapshot.data!.elementAt(j));
                      },
                      itemCount: snapshot.data!.length,
                    ),
                    const Divider(
                      indent: 80,
                      endIndent: 80,
                    ),
                  ],
                )
              : const SizedBox();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
