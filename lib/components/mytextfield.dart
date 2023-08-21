import 'package:flutter/material.dart';


class MyTextFormField extends StatelessWidget{
 final String hintText;
 final controller;
 final bool obscureText;
 final String? Function(String?)? somevalidator;
 
 
 const MyTextFormField({
  super.key,
  required this.hintText,
  required this.controller,
   this.obscureText=false,
   this.somevalidator,
  // this.somevalidator();
  });
  //  somevalidator(String text){

  //  }

  @override 
  Widget build(BuildContext context){
    return  Padding(
              padding:const  EdgeInsets.all(15.0),
              child:  TextFormField(
                
               keyboardType: TextInputType.name,
               controller: controller,
               validator: somevalidator,
               decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: hintText,
                enabledBorder:const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  
                ),
                focusedBorder:const  OutlineInputBorder(),
                
               ),
               ),
            );
  }
}