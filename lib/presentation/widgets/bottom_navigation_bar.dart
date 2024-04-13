import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gp_app/presentation/screens/add_edit_diary_screen.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
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
        if (index == 2) {
          Navigator.of(context).pushNamed(AddEditDiaryScreen.routeName);
        }
      },
    );
  }
}
