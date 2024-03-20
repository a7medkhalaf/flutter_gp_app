import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gp_app/providers/diary_entry_provider.dart';
import 'package:flutter_gp_app/screens/add_edit_diary_screen.dart';
import 'package:flutter_gp_app/screens/diary_screen.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isLinux) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => DiaryEntryProvider(),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(
            colorSchemeSeed: Colors.purple,
          ),
          debugShowCheckedModeBanner: false,
          // ignore: deprecated_member_use
          useInheritedMediaQuery: true,
          builder: DevicePreview.appBuilder,
          home: const DiaryScreen(),
          routes: {
            DiaryScreen.routeName: (ctx) => const DiaryScreen(),
            AddEditDiaryScreen.routeName: (ctx) => const AddEditDiaryScreen(),
          },
        ),
      ),
    ),
  );
}
