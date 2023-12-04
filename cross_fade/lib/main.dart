import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cross Fade Animation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Cross Fade'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override

  /* dlta za da using init state kawam means kala app start she noh 2 second ba wait kawe bya ba reload method call she landy mi jor kre hagy ki mi da state value false pass kre da*/
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      reload();
    });
  }

  /* lets declare var for cross fade*/
  bool isFirst = true;
  var alpha = 1.0;
  /* var end*/

  void reload() {
    setState(() {
      isFirst = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Container(
          color: Colors.red,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedCrossFade(
                  firstCurve: Curves.linear,
                  secondCurve: Curves.linear,
                    firstChild: SizedBox(
                       width: 200,
                        height: 200,
                       // color: Colors.grey.shade200,
                      child: Image.asset(
                        'assets/images/logoBlack.png',
                       
                        
                      ),
                    ),
                    secondChild: Image.asset(
                      'assets/images/logoBlack.png',
                      width: 300,
                      height: 300,
                    ),
                    crossFadeState: isFirst            //means ka isFirstTrue we ? mark terninery opreater dey noh isfirst true we noh showfirst matlb first child de haga okhya ao colon na bad else state de noh means ka isfirst false we noh bya ba da showsecond wakhiy
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(milliseconds: 500)),
              ],
            ),
          ),
        ));
  }
}

// simple animated splash screen da try to improve de animation dear