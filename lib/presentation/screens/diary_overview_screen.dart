import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_gp_app/config/colors.dart';
import 'package:flutter_gp_app/data/models/diary_entry.dart';
import 'package:flutter_gp_app/extensions/color_extension.dart';
import 'package:flutter_gp_app/presentation/screens/add_edit_diary_screen.dart';
import 'package:flutter_gp_app/presentation/widgets/custom_appbar.dart';
import 'package:intl/intl.dart';

class DiaryOverviewScreen extends StatelessWidget {
  const DiaryOverviewScreen(
    this.diary, {
    Key? key,
  }) : super(key: key);

  static const routeName = '/diary-overview';

  final DiaryEntry diary;

  @override
  Widget build(BuildContext context) {
    diary.activities.isEmpty
        ? diary.activities = ['...', '...', '...']
        : diary.activities;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          diary.title,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed(
                            AddEditDiaryScreen.routeName,
                            arguments: diary,
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            gradient: const LinearGradient(
                              colors: [
                                kPrimaryColor,
                                Colors.blueGrey,
                              ],
                            ),
                          ),
                          child: const Row(
                            children: [
                              Text(
                                'Edit',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 8.0),
                              Icon(Icons.edit, color: Colors.white),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DefaultTextStyle(
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: kSecondaryTextColor),
                        child: Text(DateFormat.MMMEd().format(diary.date)),
                      ),
                      const Icon(Icons.favorite_border, color: kPrimaryColor),
                    ],
                  ),
                  Row(
                    children: [
                      DefaultTextStyle(
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: kSecondaryTextColor),
                        child: const Text('Your mood was - '),
                      ),
                      DefaultTextStyle(
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: kSecondaryTextColor),
                        child: Text(
                          diary.emotion.name,
                          style: TextStyle(
                            color:
                                Colors.black.stringToColor(diary.emotion.color),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  DefaultTextStyle(
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: kMainTextColor),
                    child: Text(
                      diary.contentPlainText,
                      maxLines: 8,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Divider(color: kOutlineColor, height: 1.0),
                  const SizedBox(height: 16.0),
                  Text(
                    'Suggested Activities',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16.0),
                  SuggestedActivity(diary.activities[0]),
                  const SizedBox(height: 16.0),
                  SuggestedActivity(diary.activities[1]),
                  const SizedBox(height: 16.0),
                  SuggestedActivity(diary.activities[2]),
                  const SizedBox(height: 32.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SuggestedActivity extends StatelessWidget {
  final String activity;
  const SuggestedActivity(this.activity, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 24.0,
          width: 24.0,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(right: 16.0),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: kMainTextColor,
          ),
          child: Text(
            '*',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
        Expanded(
          child: Text(
            activity,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
