import 'dart:math';

import 'package:flutter/material.dart';

class Logic {
  double calculateBMI(double height, int weight) {
    double bmi = weight / pow(height / 100, 2);
    return bmi;
  }
}

class ResultPage extends StatefulWidget {
  double height;
  int weight;
  int age;
  // ignore: use_key_in_widget_constructors
  ResultPage({required this.height, required this.weight, required this.age});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  double bmires = 0;
  //int bmiAge = Age;
  @override
  void initState() {
    Logic l = Logic();
    bmires = l.calculateBMI(widget.height, widget.weight);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF0A0E21),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Your Results',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
            const SizedBox(height: 20,),
            Container(
              height: 400,
              width: 300,
              color: const Color(0xFF1D1E33),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if ( bmires>= 25)
                    Text('OVERWEIGHT',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.deepOrange),)
                 else if(bmires > 18.5&&bmires <25)
                    Text('NORMAL',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.green),)
                  else
                    Text('UNDERWEIGHT',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.red),),
                  const SizedBox(height: 20,),
                  Text(
                    bmires.toStringAsFixed(2),
                    style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink),
                  ),
                  const SizedBox(height: 20,),
                  Text('Normal BMI range: \n18.5 - 25 kg/m2 ',
                    style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,),
                  ),
                  const SizedBox(height: 20,),
                  if ( bmires>= 25)
                    Text('You have a more than normal body weight.\n Try to do more Exercise',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 19),)
                  else if(bmires > 18.5)
                    Text('You have a normal body weight.\nGood job!',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 19),)
                  else
                    Text('You have a lower than normal body weight.\n Try to eat more',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 19),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}