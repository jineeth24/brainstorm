import 'package:flutter/material.dart';

class AdminDropdown extends StatefulWidget {
  const AdminDropdown({super.key});

  @override
  State<AdminDropdown> createState() => _AdminDropdownState();
}

class _AdminDropdownState extends State<AdminDropdown> {

    
  // Initial Selected Value
 String? dropdownvalue ;   
  
  // List of items in our dropdown menu
  var items = [    
    'Dart',
    'Flutter',

  ];
  @override
  Widget build(BuildContext context) {
    return  DropdownButton(
      isExpanded: true,
      hint: const Text("Category"),
          
        // Initial Value
        value: dropdownvalue,
          
        // Down Arrow Icon
        icon: const Icon(Icons.keyboard_arrow_down),    
          
        // Array list of items
        items: items.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),

       
        //After selecting the desired option,it will
        // change button value to selected value
        onChanged: (String? newValue) { 
          setState(() {
            dropdownvalue = newValue??" ";
           
          });
        },
       
      );
    
  }
}