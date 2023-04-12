import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/screens/Example9.dart';
import 'package:riverpod_example/screens/example1.dart';
import 'package:riverpod_example/screens/example2.dart';
import 'package:riverpod_example/screens/example3.dart';
import 'package:riverpod_example/screens/example4.dart';
import 'package:riverpod_example/screens/example5.dart';
import 'package:riverpod_example/screens/example6.dart';
import 'package:riverpod_example/screens/example7.dart';
import 'package:riverpod_example/screens/example8.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

final nameProvider = Provider<String>((ref) {
  return 'Hello world';
});

final counterProvider = StateProvider((ref) => 0);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Example 1'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Example1()));
              },
            ),
            ElevatedButton(
              child: Text('Example 2'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Example2()));
              },
            ),
            ElevatedButton(
              child: Text('Example 3'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Example3()));
              },
            ),
            ElevatedButton(
              child: Text('Example 4'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Example4()));
              },
            ),
            ElevatedButton(
              child: Text('Example 5'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Example5()));
              },
            ),
            ElevatedButton(
              child: Text('Example 6'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Example6()));
              },
            ),
            ElevatedButton(
              child: Text('Example 7'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Example7()));
              },
            ),
            ElevatedButton(
              child: Text('Example 8'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Example8()));
              },
            ),
            ElevatedButton(
              child: Text('Example 9'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Example9()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
