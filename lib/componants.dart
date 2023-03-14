import 'package:flutter/material.dart';
class RoundedContainer extends StatefulWidget {
  const RoundedContainer({Key? key,required this.action,required this.minimumValue,required this.text}) : super(key: key);
  final Function(int) action;
  final int minimumValue;
  final String text;
  @override
  State<RoundedContainer> createState() => _RoundedContainerState();
}

class _RoundedContainerState extends State<RoundedContainer> {

  int value=-1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    value=widget.minimumValue;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFF1D1E33)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.text,style:const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
              Text('${value==-1?widget.minimumValue:value}',style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(onPressed: (){setState(() {
                    value--;

                    if(value<widget.minimumValue){
                      value=widget.minimumValue;
                    }
                    widget.action(value);
                  });},
                    mini: true,
                    backgroundColor: const Color(0xFFEB1555),child: const Icon(Icons.remove,color: Colors.white,),
                  ),
                  const SizedBox(width: 15,),
                  FloatingActionButton(onPressed: (){setState(() {
                    value++;
                    widget.action(value);
                  });},
                    mini: true,
                    backgroundColor: const Color(0xFFEB1555),child: const Icon(Icons.add,color: Colors.white,),
                  )
                ],)
            ],
          ),
        ),
      ),
    );
  }
}
Widget gend(invar,gender,icon,name,color)=>Expanded(
    child:
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap:invar,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
          ),
          child: Column(
            children: [
              Icon(icon,size: 130,),
              Text(name,style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white))
            ],
          ),
        ),
      ),
    )
);