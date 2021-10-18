import 'package:flutter/material.dart';
import 'package:basic_chess_v2/pages/home_page.dart';
import 'package:basic_chess_v2/pages/pieces_page.dart';
import 'package:basic_chess_v2/pages/splash_screen.dart';
import 'package:basic_chess_v2/pages/play_game_page.dart';
import 'package:basic_chess_v2/pages/login_screen_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chess Buddy',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home_page': (context) => HomePage(),
        '/pieces_page': (context) => PiecesPage(),
        '/play_game_page': (context) => PlayGamePage(),
        '/login_screen_page': (context) => LoginScreen(),
      },
    );
  }
}
