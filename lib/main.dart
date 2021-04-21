import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ultra_gif/src/pages/home_page.dart';
import 'package:ultra_gif/src/pages/search_page.dart';

import 'package:ultra_gif/src/theme/theme.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // lock screen rotation
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
    );

    return MaterialApp(
      theme: ultraGifTheme,
      debugShowCheckedModeBanner: false,
      title: 'Ultra GIF',
      initialRoute: '/',
      routes: {
        '/'       :   (BuildContext context) => HomePage(),
        'search'  :   (BuildContext context) => SearchPage(),
      },
    );
  }
}
