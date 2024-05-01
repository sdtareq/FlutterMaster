import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_test/pages/page1.dart';
import 'package:go_router_test/pages/page2.dart';
import 'package:go_router_test/pages/page3.dart';
import 'package:go_router_test/pages/page4.dart';
import 'package:go_router_test/router/page_name.dart';

//link: https://medium.com/@chuntdevnx/go-router-routing-in-flutter-bc3c69e85786
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final router = GoRouter(initialLocation: PageName.homeRoute,routes: [
      GoRoute(path: PageName.homeRoute,builder: (context,state) => const MyHomePage(title: "Go router test")),
      GoRoute(path: PageName.page1Route,builder: (context,state) => const Page1()),
      GoRoute(path: PageName.page2Route,builder: (context,state) => const Page2()),
      GoRoute(path: PageName.page3Route,builder: (context,state) => Page3(arg1: state.extra as String,)),
      GoRoute(path: PageName.page4Route,builder: (context,state) => Page4(extra: state.extra as Map<String, dynamic>,)),
    ]);

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(onPressed: (){context.push(PageName.page1Route);}, child: const Text("go to page one")),// normal navigation
            ElevatedButton(onPressed: (){context.go(PageName.page2Route);}, child: const Text("go to page two")), // login page like navigation
            ElevatedButton(onPressed: (){context.push(PageName.page3Route,extra: "Mango, Banana");}, child: const Text("go to page three")),
            ElevatedButton(onPressed: (){context.push(PageName.page4Route,extra: {'arg1':'fish','arg2':'Hen'});}, child: const Text("go to page three")),
          ],
        ),
      ),
    );
  }
}
