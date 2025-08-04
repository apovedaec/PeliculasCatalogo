import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:peliculas/providers/movie_provider.dart';
import 'package:peliculas/screens/home_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
   await dotenv.load(fileName: ".env");
  runApp(
    ChangeNotifierProvider(
      create: (_) => MovieProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MovieProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Catálogo de Películas',
        theme: movieTheme,
        home: HomeScreen(),
      ),
    );
  }

final ThemeData movieTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Color(0xFFE50914),
  scaffoldBackgroundColor: Color(0xFF121212),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF1F1F1F),
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white),
    bodySmall: TextStyle(color: Colors.grey[400]),
  ),
  colorScheme: ColorScheme.dark(
    primary: Color(0xFFE50914),
    secondary: Color(0xFFFFD700),
  ),
);


}
