import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/riverpod/counter_demo.dart';

//StateNotifierProvider

final counterProvider = StateNotifierProvider<CounterDemo,int>((ref) => CounterDemo());

class Example5 extends ConsumerWidget {
  const Example5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    debugPrint('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Example5'),
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
