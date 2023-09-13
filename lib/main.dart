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
          // GridItem(
          //     child: Container(
          //   decoration: BoxDecoration(
          //     color: Colors.greenAccent,
          //     borderRadius: BorderRadius.circular(5),
          //   ),
          //   height: 40,
          // ))
          //   ..md = 2
          //   ..sm = 6
          //   ..xs = 6,
          GridItem(colspans: [
            Container(
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(5),
              ),
              height: 40,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(5),
              ),
              height: 40,
            )
          ])
            ..md = 2
            ..sm = 6
            ..xs = 6,
          GridItem(
              child: Container(
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(5),
            ),
            height: 40,
          ))
            ..md = 2
            ..sm = 6
            ..xs = 6,
          GridItem(
              child: Container(
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(5),
            ),
            height: 40,
          ))
            ..md = 2
            ..sm = 6
            ..xs = 6,
          GridItem(
              child: Container(
            decoration: BoxDecoration(
              color: Colors.yellowAccent,
              borderRadius: BorderRadius.circular(5),
            ),
            height: 40,
          ))
            ..md = 6
            ..sm = 6
            ..xs = 12,
          GridItem(
              child: Container(
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(5),
            ),
            height: 40,
          ))
            ..md = 1
            ..sm = 4
            ..xs = 12,
          GridItem(
              child: Container(
            decoration: BoxDecoration(
              color: Colors.purpleAccent,
              borderRadius: BorderRadius.circular(5),
            ),
            height: 40,
          ))
            ..md = 1
            ..sm = 4
            ..xs = 12,
          GridItem(
              child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5),
            ),
            height: 40,
          ))
            ..md = 1
            ..sm = 4
            ..xs = 12,
          GridItem(
              child: Container(
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(5),
            ),
            height: 40,
          ))
            ..md = 1
            ..sm = 12
            ..xs = 12,
          GridItem(
              child: Container(
            decoration: BoxDecoration(
              color: Colors.indigoAccent,
              borderRadius: BorderRadius.circular(5),
            ),
            height: 40,
          ))
            ..md = 1
            ..sm = 12
            ..xs = 12,
          GridItem(
              child: Container(
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.circular(5),
            ),
            height: 40,
          ))
            ..md = 1
            ..sm = 12
            ..xs = 12,
          GridItem(
              child: Container(
            decoration: BoxDecoration(
              color: Colors.limeAccent,
              borderRadius: BorderRadius.circular(5),
            ),
            height: 40,
          ))
            ..md = 1
            ..sm = 12
            ..xs = 12,
          GridItem(
              child: Container(
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(5),
            ),
            height: 40,
          ))
            ..md = 1
            ..sm = 12
            ..xs = 12,
          GridItem(
              child: Container(
            decoration: BoxDecoration(
              color: Colors.purpleAccent,
              borderRadius: BorderRadius.circular(5),
            ),
            height: 40,
          ))
            ..md = 1
            ..sm = 12
            ..xs = 12,
          GridItem(
              child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5),
            ),
            height: 40,
          ))
            ..md = 1
            ..sm = 12
            ..xs = 12,
        ],
      )..gap = 2,
    );
  }
}
