import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stopwatch_flutter/ui/stopwatch.dart';

bool isLight = false;
StreamController<bool> isLightTheme = StreamController();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        initialData: true,
        stream: isLightTheme.stream,
        builder: (context, snapshot) {
          return MaterialApp(
            theme: snapshot.data == true ? ThemeData.light() : ThemeData.dark(),
            debugShowCheckedModeBanner: false,
            home: MyHomePage(),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        child: Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: isLight
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                isLight = false;
                                isLightTheme.add(true);
                              });
                            },
                            child: Icon(
                              Icons.wb_sunny,
                              size: 37,
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              setState(() {
                                isLight = true;
                                isLightTheme.add(false);
                              });
                            },
                            child: Icon(
                              Icons.nightlight,
                              size: 37,
                            ),
                          ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  AspectRatio(aspectRatio: .6, child: Stopwatch()),
                ],
              ),
            ),
          ),
        ),
        value:
            isLight ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark);
  }
}
