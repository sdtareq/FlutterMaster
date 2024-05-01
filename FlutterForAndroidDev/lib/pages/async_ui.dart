import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AsyncUI extends StatefulWidget {
  const AsyncUI({super.key});
  static String routeName = "/AsyncUI";

  @override
  State<AsyncUI> createState() => _AsyncUIState();
}

class _AsyncUIState extends State<AsyncUI> {
  List widgets = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AsyncUI.routeName),
      ),
      body: ListView.builder(
        itemBuilder: (context, position) {
          return getRow(position);
        },
        itemCount: widgets.length,
      ),
    );
  }

  Future<void> loadData() async {
    var dataURL = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    http.Response response = await http.get(dataURL);
    setState(() {
      widgets = jsonDecode(response.body);
    });
  }

  Widget getRow(int position) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text("Row ${widgets[position]["title"]}"),
    );
  }
}
