import 'package:flutter/material.dart';
import 'package:flutter_for_android_dev/pages/async_ui.dart';
import 'package:flutter_for_android_dev/pages/show_progress.dart';
import 'package:flutter_for_android_dev/pages/start_activity_for_result.dart';

//https://docs.flutter.dev/get-started/flutter-for/android-devs
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
        AsyncUI.routeName : (context)=> const AsyncUI(),
        StartActivityForResult.routeName : (context)=> const StartActivityForResult(),
        ShowProgress.routeName : (context)=> const ShowProgress(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

    );

    }

  const MyApp({super.key});
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Flutter for Android developer"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {Navigator.pushNamed(context, AsyncUI.routeName);},
            child: const Text("Async UI"),
          ),
          ElevatedButton(
            onPressed: () async {
              Object? coordinates = await Navigator.pushNamed(context, StartActivityForResult.routeName);
              //SnackBar(content: Text(coordinates!.toString()));
              print(coordinates!.toString());
              },
            child: const Text("StartActivityForResult"),
          ),
          ElevatedButton(
            onPressed: () async {
              Object? coordinates = await Navigator.pushNamed(context, ShowProgress.routeName);
              //SnackBar(content: Text(coordinates!.toString()));
              print(coordinates!.toString());
              },
            child: const Text("ShowProgress"),
          ),
        ],
      ),
    );
  }
}
