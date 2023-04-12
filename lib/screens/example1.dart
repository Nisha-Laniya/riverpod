import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/main.dart';


//read the created provider using ConsumerWidget
class Example1 extends ConsumerWidget {
  const Example1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final name = ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Example1'),
      ),
      body: Center(
        child: Text(name),
      ),
    );
  }
}
