import 'package:flutter/material.dart';

import 'grid_sys.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grid System Demo',
      theme: ThemeData(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// Extra small<576px
// Small≥576px
// Medium≥768px
// Large≥992px
// Extra large≥1200px

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);

    return Scaffold(
      body: GridContrainer(
        gridSys: [
          GridItem(
              child: Container(
            color: Colors.greenAccent,
            height: 40,
          ))
            ..md = 2
            ..sm = 6
            ..xs = 6,
          GridItem(
              child: Container(
            color: Colors.blueAccent,
            height: 40,
          ))
            ..md = 2
            ..sm = 6
            ..xs = 6,
          GridItem(
              child: Container(
            color: Colors.redAccent,
            height: 40,
          ))
            ..md = 2
            ..sm = 6
            ..xs = 6,
          GridItem(
              child: Container(
            color: Colors.yellowAccent,
            height: 40,
          ))
            ..md = 1
            ..sm = 6
            ..xs = 12,
          GridItem(
              child: Container(
            color: Colors.teal,
            height: 40,
          ))
            ..md = 1
            ..sm = 4
            ..xs = 12,
          GridItem(
              child: Container(
                color: Colors.purpleAccent,
                height: 40,
              ))
              ..md = 1
              ..sm = 4
              ..xs = 12,
          GridItem(
              child: Container(
                color: Colors.red,
                height: 40,
              ))
              ..md = 1
              ..sm = 4
              ..xs = 12,
          GridItem(
              child: Container(
                color: Colors.amber,
                height: 40,
              ))
              ..md = 1
              ..sm = 12
              ..xs = 12,
          GridItem(
              child: Container(
                color: Colors.indigoAccent,
                height: 40,
              ))
              ..md = 1
              ..sm = 12
              ..xs = 12,
          GridItem(
              child: Container(
                color: Colors.pinkAccent,
                height: 40,
              ))
              ..md = 1
              ..sm = 12
              ..xs = 12,
          GridItem(
              child: Container(
                color: Colors.limeAccent,
                height: 40,
              ))
              ..md = 1
              ..sm = 12
              ..xs = 12,
          GridItem(
              child: Container(
                color: Colors.teal,
                height: 40,
              ))
              ..md = 1
              ..sm = 12
              ..xs = 12,
          GridItem(
              child: Container(
                color: Colors.purpleAccent,
                height: 40,
              ))
              ..md = 1
              ..sm = 12
              ..xs = 12,
          GridItem(
              child: Container(
                color: Colors.red,
                height: 40,
              ))
              ..md = 1
              ..sm = 12
              ..xs = 12,
        ],
      ),
    );
  }
}
