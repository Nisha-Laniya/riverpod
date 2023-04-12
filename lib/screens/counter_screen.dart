import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../riverpod/counter_demo.dart';

//Auto dispose

final counterProvider = StateNotifierProvider.autoDispose<CounterDemo,int>((ref) {
  final link = ref.keepAlive();
  final timer = Timer(Duration(seconds: 10), () {
    link.close();
  });
  ref.onDispose(() => timer.cancel());
  return CounterDemo();
});

class CounterScreen extends ConsumerWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter screen'),
      ),
      body: Center(
        child: Text(counter.toString(),style: TextStyle(fontSize: 30),),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          ref.read(counterProvider.notifier).increament();
        },
      ),
    );
  }
}
