import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gp_app/bloc/diary_bloc.dart';
import 'package:flutter_gp_app/data/repository/diary_repository.dart';
import 'package:flutter_gp_app/presentation/screens/add_edit_diary_screen.dart';
import 'package:flutter_gp_app/presentation/screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DiaryRepository().initHive();

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => RepositoryProvider(
        create: (context) => DiaryRepository(),
        child: BlocProvider(
          create: (context) => DiaryBloc(context.read<DiaryRepository>()),
          child: MaterialApp(
            theme: ThemeData(colorSchemeSeed: Colors.green),
            debugShowCheckedModeBanner: false,
            // ignore: deprecated_member_use
            useInheritedMediaQuery: true,
            builder: DevicePreview.appBuilder,
            home: const MainScreen(),
            routes: {
              AddEditDiaryScreen.routeName: (ctx) => const AddEditDiaryScreen(),
            },
          ),
        ),
      ),
    ),
  );
}
