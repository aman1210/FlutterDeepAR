import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterDeepAr/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeepAR',
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        accentColor: Colors.amber,
      ),
      home: Home(),
    );
  }
}
