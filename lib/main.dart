import 'package:flutter/material.dart';
import 'package:untitled1/result.dart';
import 'componants.dart';


void main() {
  runApp(MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor:const Color(0xFF0A0E21),
      ),
      debugShowCheckedModeBanner: false,
      home:const MyApp())
  );
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyApp();
}
enum Gender{male,female,noyet,}

class _MyApp extends State<MyApp> {
  double height=165;
  int age=18;
  int weight=50;

  Gender gender=Gender.noyet;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: const Color(0xFF0A0E21),
        title: const Center(child: Text('BMI Calculator',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            )),
      ),
      body: Column(
        children: [
          Expanded(
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  gend((){ setState(() {
                    gender=Gender.male;
                  });}, gender,Icons.male,'Male',gender==Gender.male ? const Color(0xFFEB1555): const Color(0xFF1D1E33)),
                  gend((){ setState(() {
                    gender=Gender.female;
                  });}, gender,Icons.female,'Female',gender==Gender.female ? const Color(0xFFEB1555): const Color(0xFF1D1E33)),
                ],
              )),
          Expanded(
              child:
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFF1D1E33)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Height',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('${height.round()}',style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
                          const Text('CM',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: const Color(0xFF8D8E98),
                          thumbColor: const Color(0xFFEB1555),
                          overlayColor: const Color(0x29EB1555),
                          thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 35.0),
                        ),
                        child: Slider(value: height,
                            max: 220,
                            min: 140,
                            divisions: 80,
                            label: height.round().toString(),
                            onChanged: (value){
                              setState(() {
                                height=value;
                              });
                            }),
                      )
                    ],
                  ),
                ),
              )
          ),
          Expanded(
            child:Row(
              children: [
                RoundedContainer(action: (newAge){
                  age=newAge;
                },minimumValue: 18,text: "Age"),
                RoundedContainer(action: (newWeight){weight=newWeight;}, minimumValue: 30, text: "Weight")
              ],
            ),),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            color: const Color(0xFFEB1555),
            child: MaterialButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(height: height,weight: weight,age: age,)));
                },
                height: 50,
                minWidth: double.infinity,
                child: const Text('CALCULATE',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),)),
          )
        ],
      ),
    );
  }
}



