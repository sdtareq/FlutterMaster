import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  final String? arg1;
  const Page3({super.key,this.arg1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 3"),
      ),
      body: Center(child: Text("This page 3 and arg1 is: ${arg1!}")),
    );
  }
}
