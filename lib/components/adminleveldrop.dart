import 'package:flutter/material.dart';
class Adminleveldrop extends StatefulWidget{

final  List <String>items;
final  String hinttext;

  const Adminleveldrop({super.key, required this.items,required this.hinttext});

  @override
  State<Adminleveldrop> createState() => _AdminleveldropState(  );
}

class _AdminleveldropState extends State<Adminleveldrop> {
  String? dropdownvalue;
  
  
  

@override
Widget build(BuildContext context){
  return Container(
    width: 320,
    height: 60,
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      border:Border.all(),
      borderRadius: BorderRadius.circular(15)
       ),
    child: DropdownButton(
      isExpanded: true,
      
      value: dropdownvalue,
      hint: Text(widget.hinttext),
      items:  widget.items.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(), 
      onChanged: (String? newValue) { 
            setState(() {
              dropdownvalue = newValue??" ";
             
            });
          }),
  );
}
}