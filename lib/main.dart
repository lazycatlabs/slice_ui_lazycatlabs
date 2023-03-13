import 'package:flutter/material.dart';
import 'package:slice_ui_lazycatlabs/helper/data_helper.dart';

import 'pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slice UI Lazycatlabs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Slice UI Lazycatlabs'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// Here we will create list of DataHelper
  /// for buttons
  late final _listMenu = [
    DataHelper(
      title: "Slice UI Part 1 - Animated Mouse",
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const Part1Page(),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        /// add some padding
        padding: const EdgeInsets.all(24),
        itemCount: _listMenu.length,
        itemBuilder: (_, index) {
          return ElevatedButton(
            onPressed: _listMenu[index].onPressed,
            // also here we need to add some padding
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(_listMenu[index].title),
            ),
          );
        },
      ),
    );
  }
}
