import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ShowProgress extends StatefulWidget {
  const ShowProgress({super.key});
  static String routeName = "/ShowProgress";

  @override
  State<ShowProgress> createState() => _ShowProgressState();
}

class _ShowProgressState extends State<ShowProgress> {

  List widgets = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Widget getBody(){
    bool showLoadingDialog = widgets.isEmpty;
    if(showLoadingDialog){
      return getProgressDialog();
    }else{
      return getListView();
    }
  }
  Widget getProgressDialog() {
    return const Center(child: CircularProgressIndicator(),);
  }

  Widget getListView() {
    return ListView.builder(itemBuilder: (context,position){
      return getRow(position);
    },itemCount: widgets.length,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ShowProgress.routeName),
      ),
      body: getBody(),
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
