import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//State Provider

final counterProvider = StateProvider((ref) => 0);

class Example4 extends ConsumerWidget {
  const Example4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    print('build');
    final count = ref.watch(counterProvider);
    ref.listen(counterProvider, (previous, next) {
      if(next == 5) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('The value is $next')));
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Example 4'),
        actions: [
          Consumer(
            builder: (context,ref,child) {
              final count = ref.watch(counterProvider);
              return IconButton(onPressed: () {
                  // ref.invalidate(counterProvider);
                ref.refresh(counterProvider);
              }, icon: Icon(Icons.refresh));
            },
          )
        ],
      ),
      body: Consumer(
        builder: (context,ref,child) {
          final count = ref.watch(counterProvider);
          return Center(
            child: Text(count.toString(),style: TextStyle(fontSize: 30),),
          );
        },
      ),
      floatingActionButton: Consumer(
        builder: (context,ref,child) {
          return FloatingActionButton(
            onPressed: (){

              // ref.read(counterProvider.notifier).state++;
              ref.read(counterProvider.notifier).update((state) => state+1);
            },
            child: Icon(Icons.add),
          );
        },
      ),
    );
  }
}
