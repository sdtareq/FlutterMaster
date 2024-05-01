import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 1"),
      ),
      body: const Center(child: Text("This page 1")),
    );
  }
}
