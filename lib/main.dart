import 'dart:math';

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
      title: 'Flutter Demo',
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  String misol = "15 + 25 = ";
  String edtJavob = "";
  int togriJavob = 0;
  String toast = "";

  final TextEditingController _controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(toast),
          Center(
            child: Text(
              misol,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          TextField(
            // keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: "Javob yozing"),
            controller: _controller,
            onChanged: (value) {
              setState(() {
                javobTekshir(value);
              });
            },
          )
        ],
      ),
    );
  }

  @override
  void initState(){
    super.initState();
    randomSonaniqla();
  }

  int number1 = 0;
  int number2 = 0;
  int amal = 0;

  void randomSonaniqla() {
    number1 = Random().nextInt(20);
    number2 = Random().nextInt(20);
    amal = Random().nextInt(4);

    setState(() {
      misolYoz();
    });

  }

  void misolYoz(){
    switch(amal){
      case 0: {
        misol = "$number1 + $number2 = ";
        togriJavob = number1 + number2;
      }break;
      case 1: {
        misol = "$number1 - $number2 = ";
        togriJavob = number1 - number2;
      }break;
      case 2: {
        misol = "$number1 * $number2 = ";
        togriJavob = number1 * number2;
      }break;
      case 3: {
        misol = "$number1 / $number2 = ";
        togriJavob = int.parse((number1 / number2) as String);
      }break;
    }

  }

  void javobTekshir(String value){
    if(togriJavob.toString().length == value.length){
      if(togriJavob == int.parse(value)){
        toast = "To'g'ri javob";
      }else{
        toast = "Noto'gri javob";
      }
      _controller.text = "";
      randomSonaniqla();
    }
  }
}
