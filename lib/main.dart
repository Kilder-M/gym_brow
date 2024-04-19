import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gymbrow/app/core/routes/app_pages.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:gymbrow/app/core/utils/l10n/l10n.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: L10n.all,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color.fromARGB(255, 101, 247, 106),
        brightness: Brightness.light,
      ),
    ),
  );
}
