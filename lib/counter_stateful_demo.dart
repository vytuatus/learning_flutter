import 'package:flutter/material.dart';

class CounterStatefulDemo extends StatefulWidget {

  Color buttonColor;
  CounterStatefulDemo({Key? key, required this.buttonColor}) : super(key: key);

  @override
  _CounterStatefulDemoState createState() => _CounterStatefulDemoState();
}

class _CounterStatefulDemoState extends State<CounterStatefulDemo> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: widget.buttonColor,
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Text(_counter.toString())),
    );
  }
}