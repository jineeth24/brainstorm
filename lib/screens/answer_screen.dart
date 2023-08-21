import 'package:brainstorm/db/functions/dbfunctions.dart';
import 'package:flutter/material.dart';

class AnswerScreen extends StatefulWidget{
   final String category;
  final int level;
  final int userid;

  const AnswerScreen({super.key, required this.category, required this.level,required this.userid});
  
  @override
  State<AnswerScreen> createState() => _AnswerScreenState();
  
}


class _AnswerScreenState extends State<AnswerScreen> {
   @override
  void initState() {
  
    super.initState();
    getQuestionOfLevel(widget.category, widget.level);
  
  }
  @override 
  Widget build(BuildContext context){
   // List questionoflevel=getQuestionOfLevel(widget.category,widget.level);
  
    return Scaffold(
      appBar: AppBar(title:const Text('Answers'),backgroundColor: Colors.black,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: questionOfLevel.length,
          itemBuilder: (context, index) {
          
          return  ListTile(
              leading: Text((index+1).toString()),
              title: Text(questionOfLevel[index].question),
              subtitle: Text(questionOfLevel[index].answer,style:const TextStyle(color: Colors.green),),
            );
          }
            
          
        ),
      ),
    );
  }
}