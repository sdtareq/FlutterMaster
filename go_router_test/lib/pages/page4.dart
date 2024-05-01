import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page4 extends StatelessWidget {
  final Map<String, dynamic>? extra;
  const Page4({super.key, this.extra});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 4"),
      ),
      body:  Center(child: Text("This page 4 and arg1 is: ${extra!['arg1']} and arg2 is: ${extra!['arg2']}")),
    );
  }
}
