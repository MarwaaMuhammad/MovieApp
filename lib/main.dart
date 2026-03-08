import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movieapp/screens/HomeScreen.dart';
import 'package:movieapp/screens/Movie_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'View_Model/View_Model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: "assets/.env");

  final prefs = await SharedPreferences.getInstance();

  final bool? localDarkMode = prefs.getBool('isDarkMode');

  print("fetched from local storage: $localDarkMode");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder(
        valueListenable: vm.isDarkMode,
        builder:(context, value, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: vm.isDarkMode.value ? ThemeData.dark() : ThemeData.light(),
              home: Homescreen()
          );
      }

    );
  }
}
