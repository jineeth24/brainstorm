import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget{
  final String optionNumber;
  final String optinValue;

const OptionCard({super.key, required this.optionNumber,required this.optinValue});

  @override 
  Widget build(BuildContext context){
    return SizedBox(
     
      width: 280,
      height: 60,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        color: Colors.white,
        child:Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             const SizedBox(width: 20,) ,
             Text(optionNumber,style:const TextStyle(fontSize: 20),),
              const SizedBox(width: 20,) ,
             Text(optinValue,style:const TextStyle(fontSize: 20),),

          ],
        ) 
      ),
    );
  }
}