import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/main.dart';

//Read the created provider using consumer
class Example2 extends StatelessWidget {
  const Example2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example 2'),
      ),
      body: Center(
        child: Consumer(
          builder: (context,ref,child) {
            final name = ref.watch(nameProvider);
            return Text(name);
          },
        ),
      ),
    );
  }
}
