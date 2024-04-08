import 'package:flutter/material.dart';
import 'package:flutter_gp_app/database/diary_entry_provider.dart';
import 'package:flutter_gp_app/widgets/diary_list_view_per_month.dart';
import 'package:provider/provider.dart';

class DiaryListView extends StatelessWidget {
  const DiaryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<DiaryEntryProvider>(
        context,
        listen: false,
      ).diaryEntriesByMonth,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          return ListView.builder(
            itemBuilder: (context, i) {
              return Consumer(
                  builder: (context, DiaryEntryProvider diaryEntryProvider, _) {
                return DiaryListViewPerMonth(i);
              });
            },
            itemCount: snapshot.data!.length,
          );
        } else {
          return const Center(
            child: Text('No diary entries found.'),
          );
        }
      },
    );
  }
}
