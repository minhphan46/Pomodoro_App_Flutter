import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pomodoro_app/widgets/TabsScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color appColor = Color(0xff0096C7);

  void changeAppColor(Color newColor) {
    setState(() {
      appColor = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: appColor,
          //Color(0xff0096C7),
        ),
      ),
      //home: TabsScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(changeAppColor),
      },
    );
  }
}
