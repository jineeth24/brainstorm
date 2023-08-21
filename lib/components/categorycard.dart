import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget{

  final String categoryimage;

 const CategoryCard({super.key, required this.categoryimage});

  @override 
  Widget build(BuildContext context){
    return Container(
      width: 250,
      height: 120,
      margin:const EdgeInsets.all(20),
      child: Card(
        margin:const EdgeInsets.symmetric(horizontal: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
       
        child: Image.asset(categoryimage,fit: BoxFit.contain,),
      ),
    );
  }
}