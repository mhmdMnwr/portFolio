// import 'package:flutter/material.dart';

// class ThemeProvider extends ChangeNotifier {
//   bool _isDarkMode = true;

//   bool get isDarkMode => _isDarkMode;

//   void toggleTheme() {
//     _isDarkMode = !_isDarkMode;
//     notifyListeners();
//   }

//   ThemeData get currentTheme => darkTheme;

//   // Dark Theme
//   static final ThemeData darkTheme = ThemeData(
//     brightness: Brightness.dark,
//     primarySwatch: Colors.deepPurple,
//     scaffoldBackgroundColor: const Color(0xFF1a1a2e),
//     appBarTheme: AppBarTheme(
//       backgroundColor: Colors.black.withOpacity(0.95),
//       foregroundColor: Colors.white,
//     ),
//   );

//   // Gradient colors
//   List<Color> get backgroundGradient => [
//         const Color(0xFF1a1a2e),
//         const Color(0xFF16213e),
//         const Color(0xFF0f3460),
//       ];
// }
