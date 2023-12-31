import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:expense_tracker/widgets/expenses.dart';
var kColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 101));
var kDarkColorTheme=ColorScheme.fromSeed(brightness:Brightness.dark, seedColor: const Color.fromARGB(255, 5, 99, 125));
void main() {
  /*SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((fn){*/
    runApp(
        MaterialApp(
          darkTheme: ThemeData.dark().copyWith(
            useMaterial3: true,
            colorScheme: kDarkColorTheme,
            cardTheme: const CardTheme().copyWith(
              color: kDarkColorTheme.secondaryContainer,
              margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kDarkColorTheme.primaryContainer,
                  foregroundColor: kDarkColorTheme.onPrimaryContainer,
                )
            ),

          ),
          theme: ThemeData().copyWith(
              useMaterial3: true,
              colorScheme: kColorScheme,
              appBarTheme: const AppBarTheme().copyWith(
                backgroundColor: kColorScheme.onPrimaryContainer,
                foregroundColor: kColorScheme.primaryContainer,
              ),
              cardTheme: const CardTheme().copyWith(
                color: kColorScheme.secondaryContainer,
                margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),

              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kColorScheme.primaryContainer,
                  )
              ),
              textTheme: ThemeData().textTheme.copyWith(
                  titleLarge: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kColorScheme.onSecondaryContainer,
                      fontSize: 17
                  )
              )
          ),
          themeMode: ThemeMode.system,//default
          home: const Expenses(),
        )
    );
  /*});*/

}

