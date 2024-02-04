import 'package:chts_app/pages/coin.dart';
import 'package:chts_app/repositories/abstract_coins_repos.dart';
import 'package:chts_app/repositories/coins_repos.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'pages/home.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
      () => CoinsRepository(dio: Dio()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 14),
          bodySmall: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(239, 223, 223, 223),
              fontSize: 12),
          bodyLarge: TextStyle(
            fontFamily: 'Poppins',
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        listTileTheme: ListTileThemeData(
          iconColor: const Color.fromARGB(255, 170, 170, 170),
          tileColor: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
          selectedTileColor:
              const Color.fromARGB(255, 255, 255, 255).withOpacity(0.2),
        ),
        appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(
          color: Color.fromARGB(255, 170, 170, 170),
        )),
      ),
      title: 'Flutter Demo',
      routes: {
        '/': (context) => HomePage(),
        '/bobr': (context) => BobrPage(),
      },
    );
  }
}
