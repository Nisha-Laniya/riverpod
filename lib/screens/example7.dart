import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = StreamProvider((ref) => Stream.periodic(Duration(seconds: 2),((computationCount) => computationCount)));

class Example7 extends ConsumerWidget {
  const Example7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final streamData = ref.watch(streamProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Example 7'),
      ),
      body: streamData.when(data: (data) {
        return Center(child: Text(data.toString(),style: TextStyle(fontSize: 30),));
      }, error: (error,stackTrace) => Text(error.toString()), loading: () {
        return Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
