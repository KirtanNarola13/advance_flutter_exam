import 'package:advance_flutter_exam/Moduls/Screens/DetailScreen/Provider/fav_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Moduls/Screens/DetailScreen/Views/detail_screen.dart';
import 'Moduls/Screens/HomeScreen/Views/home_screen.dart';
import 'Moduls/Screens/SavedScreen/Views/saved_screen.dart';
import 'Moduls/Screens/SplashScreen/Views/splash_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) {
      ListenableProvider(create: (context) => FavProvider());
    },
    builder: (context, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true, fontFamily: 'Raleway'),
        routes: {
          '/': (context) => const SplashScreen(),
          'home_screen': (context) => const HomeScreen(),
          'detail_screen': (context) => const DetailScreen(),
          'saved_screen': (context) => const SavedScreen(),
        },
      );
    },
  ));
}
