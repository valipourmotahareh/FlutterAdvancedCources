import 'package:advanced_flutter/features/provider/counter.provider.dart';
import 'package:advanced_flutter/features/provider/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
       ChangeNotifierProvider(create: (_) => CounterProvider())
    ],
    child: const MyApp(),)

  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute:'/',
      routes:{'/':(context) => HomeViewProvider()},
    );
  }
}