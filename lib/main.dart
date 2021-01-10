import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.orangeAccent,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'CALCULATOR',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
        ),
        body: Calculator(),
      ),
    );
  }
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[100],
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(8),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          buildBackground(),
          Positioned(
            top: 0,
            child: buildMonitor(),
          ),
          KeyBoard(),
        ],
      ),
    );
  }

  Container buildMonitor() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: 320,
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '123,5',
            style: TextStyle(
              fontSize: 20,
              color: Colors.blueGrey,
            ),
          ),
          Divider(
            thickness: 2,
            indent: 10,
            endIndent: 10,
            color: Colors.grey,
            height: 0,
          ),
          Text(
            '123,5',
            style: TextStyle(
              fontSize: 40,
              color: Colors.blueGrey[700],
            ),
          ),
          //Text('answer')
        ],
      ),
    );
  }

  Container buildBackground() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepOrangeAccent[400],
        borderRadius: BorderRadius.circular(20),
      ),
      width: double.infinity,
      height: 600,
    );
  }
}

class KeyBoard extends StatelessWidget {
  const KeyBoard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blue,
      width: 500,
      height: 450,
      child: Row(
        children: [
          Column(
            children: [
              RowOfKeys(
                first: 'M-',
                second: 'M+',
                third: 'MR',
              ),
              RowOfKeys(
                first: 'C',
                second: '+/-',
                third: '%',
              ),
              RowOfKeys(
                first: '7',
                second: '8',
                third: '9',
              ),
              RowOfKeys(
                first: '4',
                second: '5',
                third: '6',
              ),
              RowOfKeys(
                first: '1',
                second: '2',
                third: '3',
              ),
              RowOfKeys(
                first: '0',
                second: 'AC',
                third: '.',
              ),
            ],
          ),
          Column(
            children: [
              buildButton(number: '+'),
              buildButton(number: '*'),
              buildButton(number: '/'),
              buildButton(number: '-'),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.yellowAccent[400],
                    borderRadius: BorderRadius.circular(1000),
                  ),
                  width: 60,
                  height: 135,
                  child: Center(
                    child: Text(
                      '=',
                      style: TextStyle(
                        decorationColor: Colors.red,
                        decorationStyle: TextDecorationStyle.solid,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0,
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

Padding buildButton({String number}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.circular(1000),
      ),
      width: 60,
      height: 60,
      child: Center(
        child: Text(
          '$number',
          style: TextStyle(
            decorationColor: Colors.red,
            decorationStyle: TextDecorationStyle.solid,
            fontWeight: FontWeight.w500,
            letterSpacing: 0,
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
    ),
  );
}

class RowOfKeys extends StatelessWidget {
  const RowOfKeys({
    this.first,
    this.second,
    this.third,
    Key key,
  }) : super(key: key);
  final String first;
  final String second;
  final String third;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        buildButton(number: first),
        buildButton(number: second),
        buildButton(number: third),
      ],
    );
  }
}
