import 'package:flutter/material.dart';

class LevelCard extends StatelessWidget{
  final String level;
  final bool open;
  

 const LevelCard({super.key, required this.level,required this.open});



  @override 
  Widget build(BuildContext context){
    return SizedBox(
     
      width: 200,
      height: 100,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            
            Center(child: Text(level,style:const TextStyle(fontSize: 20),)),
            //lock icon,
            Container(child:(open?const Icon(Icons.lock_open):const Icon(Icons.lock)))
          ],
        ),
      ),
    );
  }
}