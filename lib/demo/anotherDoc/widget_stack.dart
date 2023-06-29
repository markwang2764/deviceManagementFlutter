import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetStack extends StatelessWidget {
  const WidgetStack({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Stack(
        fit: StackFit.loose,
        children: [
          LayoutBuilder(builder: (_, constraints) {
            print(constraints);
            return Container(
              color: Colors.yellow,
              width: 140,
              height: 140,
            );
          }),
          LayoutBuilder(builder: (_, constraints) {
            print(constraints);
            return Container(
              color: Colors.green,
              width: 100,
              height: 100,
            );
          }),
          LayoutBuilder(builder: (_, constraints) {
            print(constraints);
            return Container(
              color: Colors.red,
              width: 80,
              height: 80,
            );
          })
        ],
      ),
    );
  }
}
