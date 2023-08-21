
import 'package:brainstorm/adminpanel/viewquestion_screen.dart';
import 'package:brainstorm/components/mytextfield.dart';
import 'package:brainstorm/db/functions/dbfunctions.dart';
import 'package:brainstorm/db/model/datamodel.dart';


import 'package:flutter/material.dart';

class AddQuestionScreen extends StatefulWidget{
// final List<Map<String,String>>question;

const AddQuestionScreen({super.key});

  @override
  State<AddQuestionScreen> createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {


  final questionController=TextEditingController();

  final optionControllerA=TextEditingController();

  final optionControllerB=TextEditingController();

  final optionControllerC=TextEditingController();

  final optionControllerD=TextEditingController();

  final answerController=TextEditingController();

// List<Map<String,String>>question=[
List <int>levels=[1,2,3];
List <String>categories=["Dart","Flutter"];

String? categorydropdownvalue;
int? leveldropdownvalue;
var questionlistlength=questionsList.length;


  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Question"),
      ),
      body: SafeArea(
        child: Padding(
          padding:const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
            children: [

              Container(
                width: 320,
                height: 60,
                padding:const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border:Border.all(),
                  borderRadius: BorderRadius.circular(15)
                  ),
                child: DropdownButton(
                  isExpanded: true,
                  
                  value: categorydropdownvalue,
                  hint:const Text("categories"),
                  items:  categories.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(), 
                  onChanged: (String? newValue) { 
                        setState(() {
                          categorydropdownvalue = newValue??" ";
                        
                        });
                      }),
              ),
             const SizedBox(height: 20,),
  
              Container(
                  width: 320,
                  height: 60,
                  padding:const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border:Border.all(),
                    borderRadius: BorderRadius.circular(15)
                    ),
                  child: DropdownButton(
                    isExpanded: true,
      
                    value: leveldropdownvalue,
                    hint:const  Text("Level"),
                    items:  levels.map((int items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text("$items"),
                          );
                        }).toList(), 
                    onChanged: (int? newValue) { 
                          setState(() {
                            leveldropdownvalue = newValue?? 0;
                          
                          });
                        }),
            ),



                 
         
              MyTextFormField(hintText: "Question", controller: questionController, ),
                MyTextFormField(hintText: "OptionA", controller: optionControllerA),
              MyTextFormField(hintText: "OptionB", controller: optionControllerB) ,
               MyTextFormField(hintText: "OptionC", controller: optionControllerC,),
                 MyTextFormField(hintText: "OptionD", controller: optionControllerD, ),
                 MyTextFormField(hintText: "Answer", controller: answerController, ),
                 TextButton(
                  onPressed: (){
                    onsubmitButton();
                    setState(() {
                       questionlistlength=questionsList.length;
                    });  
                    
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx){ return const ViewQuestionScreen();}));
                  },
                   child:const Text("submit")),
            
          ]),),
        ),
      ),
    );
  }

 Future <void> onsubmitButton()async{
    final category=categorydropdownvalue;
    final level= leveldropdownvalue;
    final question= questionController.text;
    final optionA=optionControllerA.text;
    final optionB=optionControllerB.text;
    final optionC= optionControllerC.text;
    final optionD=optionControllerD.text;
    final answer=answerController.text;

    Quizmodel quest1=Quizmodel(
      category: category!,
       level: level!, 
       question: question, 
       optionA: optionA, 
       optionB: optionB, 
       optionC: optionC, 
       optionD: optionD, 
       answer: answer);
      addQuestion(quest1);
    
      setState(() {
          questionlistlength=questionsList.length;
      });

  }
}

