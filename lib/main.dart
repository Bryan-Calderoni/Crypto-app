import 'package:bitcoin_ticker/Widget/constant.dart';
import 'package:flutter/material.dart';
import 'price_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: KcolorBackground,
        primaryColor: KcolorPrimary,
        accentColor: Colors.green,
        fontFamily: 'Poppins',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(color: Colors.white),
            headline6: TextStyle(
              fontSize: 28,
              fontFamily: 'Poppins',
            )),
      ),
      home: PriceScreen(),
    );
  }
}

// .dark().copyWith(
//           primaryColor: Colors.lightBlue,
//           scaffoldBackgroundColor: Colors.white),
