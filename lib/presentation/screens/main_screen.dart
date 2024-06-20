import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gp_app/bloc/diary_bloc.dart';
import 'index.dart';

enum Page { diary, calendar, review, profile }

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DiaryBloc>(context).add(DiaryGetAllByMonth());
    final controller = PageController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My App'),
          actions: [
            TextButton(
              child: const Text('Reset'),
              onPressed: () {
                BlocProvider.of<DiaryBloc>(context).add(DiaryReset());
              },
            ),
          ],
        ),
        body: BlocConsumer<DiaryBloc, DiaryState>(
          listener: (context, state) {
            if (state is DiaryInitial) {
              BlocProvider.of<DiaryBloc>(context).add(DiaryGetAllByMonth());
            }
          },
          builder: (context, state) {
            if (state is! DiaryLoaded) {
              return const Center(child: CircularProgressIndicator());
            }
            return PageView(
              controller: controller,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                DiaryPage(),
                CalenderPage(),
                ReviewPage(),
                ProfilePage(),
              ],
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        bottomNavigationBar: ConvexAppBar(
          style: TabStyle.fixedCircle,
          backgroundColor: Colors.white,
          color: Theme.of(context).colorScheme.secondary,
          activeColor: Theme.of(context).colorScheme.primary,
          items: const [
            TabItem(icon: Icons.home),
            TabItem(icon: Icons.calendar_month),
            TabItem(icon: Icons.add),
            TabItem(icon: Icons.bar_chart),
            TabItem(icon: Icons.people),
          ],
          onTap: (index) {
            if (index == 0) {
              controller.jumpToPage(Page.diary.index);
            } else if (index == 1) {
              controller.jumpToPage(Page.calendar.index);
            } else if (index == 2) {
              Navigator.of(context).pushNamed(AddEditDiaryScreen.routeName);
            } else if (index == 3) {
              controller.jumpToPage(Page.review.index);
            } else if (index == 4) {
              controller.jumpToPage(Page.profile.index);
            }
          },
        ),
      ),
    );
  }
}
