import 'package:flutter/material.dart';

class OrangeCard extends StatelessWidget{
  const OrangeCard({super.key});

  @override
  Widget build(BuildContext context){
    return  Card(
                color:const  Color.fromARGB(255, 247, 175, 68),
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))
    );
                
  }
}