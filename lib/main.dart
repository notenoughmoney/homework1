import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Мои животные'),
    );
  }
}

const nameList = ["John", "Erik", "Bob", "Xander", "Luke", "Mark"];

class Animal {
  String? name;
  int? age;
  int? height;
}

Animal generateAnimal() {
  var rng = Random();
  Animal animal = new Animal();
  animal.name = nameList[rng.nextInt(5)];
  animal.age = rng.nextInt(40);
  animal.height = rng.nextInt(500);
  return animal;
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  
  List<Animal> list = [];
  List<Widget> toDisplay = [];

  void _incrementCounter() {
    /////
    setState(() {
      _counter++;
      // формируем животного
      var animal = generateAnimal();
      // добавляем его в лист
      list.add(animal);
      // формируем лист для отображения
      toDisplay.add(
        Container(
          width: 400,
          height: 100,
          margin: EdgeInsets.only(top:10, left: 10, right: 10),
          padding: EdgeInsets.only(top:8, bottom: 8, left: 8, right: 8),
          decoration:BoxDecoration(
            color: Colors.cyan,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 3),
          ),
          child: Text(
            "Имя: ${animal.name} \nВозраст: ${animal.age} \nВысота: ${animal.height}",
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column( // вот эта штука ыхыуыуыуувцкак й бесит меня
          children: toDisplay,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
