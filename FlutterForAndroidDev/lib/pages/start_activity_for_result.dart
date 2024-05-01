import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartActivityForResult extends StatelessWidget {
  static String routeName = "/StartActivityForResult";
  const StartActivityForResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(routeName),
      ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          margin: const EdgeInsets.all(30.0),

          height: 200,
          width: double.infinity,
          alignment: Alignment.center,
          transform: Matrix4.rotationZ(0.1),
          child: ElevatedButton(onPressed: (){
            Navigator.of(context).pop({'lat': 43.821757, 'long': -79.226392});
          }, child: Text("send back some data")),
        ),
      ),
    );
  }
}
