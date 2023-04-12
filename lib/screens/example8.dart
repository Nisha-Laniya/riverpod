import 'package:flutter/material.dart';

import 'counter_screen.dart';

class Example8 extends StatelessWidget {
  const Example8({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter'),),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CounterScreen()));
          },
          child: Text('Counter'),
        ),
      ),
    );
  }
}
