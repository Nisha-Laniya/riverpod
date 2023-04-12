import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/main.dart';

//Reading provider for StatefulWidget
class Example3 extends ConsumerStatefulWidget {
  const Example3({Key? key}) : super(key: key);

  @override
  _Example3State createState() => _Example3State();
}

class _Example3State extends ConsumerState<Example3> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final name = ref.read(nameProvider);
    print(name);
  }

  @override
  Widget build(BuildContext context) {
    final name = ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Example 3'),
      ),
      body: Center(
        child: Text(name),
      ),
    );
  }
}
