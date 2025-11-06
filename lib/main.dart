import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_lyrics_app/app.dart';
import 'package:music_lyrics_app/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await setupServiceLocator();
  runApp(App());
}
