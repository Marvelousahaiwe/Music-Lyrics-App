import 'package:flutter/material.dart';
import 'package:music_lyrics_app/repositories/local_storage_repository.dart';
import 'package:music_lyrics_app/screens/dashboard_screen/dashboard_screen.dart';
import 'package:music_lyrics_app/service_locator.dart';

import 'package:theme_provider/theme_provider.dart';

import 'app_themes/app_themes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      themes: appThemes,
      loadThemeOnInit: true,
      saveThemesOnChange: true,
      child: ThemeConsumer(
          child: Builder(
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return ValueListenableBuilder(
              valueListenable: serviceLocator
                  .get<LocalStorageRepository>()
                  .fontFactorListenable,
              builder: (context, dynamic fontFactor, _) {
                return MediaQuery(
                  child: child!,
                  data: MediaQuery.of(context).copyWith(
                    textScaleFactor: fontFactor,
                  ),
                );
              },
            );
          },
          theme: ThemeProvider.themeOf(context).data,
          home: Scaffold(
            body: DashboardScreen(),
          ),
        ),
      )),
    );
  }
}
