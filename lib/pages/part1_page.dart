import 'package:flutter/material.dart';
import 'package:slice_ui_lazycatlabs/widgets/widgets.dart';

class Part1Page extends StatelessWidget {
  const Part1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animated Mouse")),
      body: const Center(child: AnimatedMouse()),
    );
  }
}
