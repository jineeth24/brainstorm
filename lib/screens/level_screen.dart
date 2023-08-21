
import 'package:brainstorm/components/levelcard.dart';
import 'package:brainstorm/components/orangecard.dart';
import 'package:brainstorm/db/functions/dbfunctions.dart';
import 'package:brainstorm/db/model/datamodel.dart';
import 'package:brainstorm/screens/quiz_screen.dart';

import 'package:flutter/material.dart';

class LevelScreen extends StatefulWidget{
  final String category;
  final int userid;
 const LevelScreen( {super.key, required this.category,required this.userid});
  @override
  State<LevelScreen> createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen> {
int score=0;

bool lock=false;
@override
void initState() {
    
     getscore();
    super.initState();
   
  }
void getscore(){
 setState(() {
 // UserModel currentuser = getUserByUserId(widget.userid)!;

  if(score>=15){
    lock=true;

  }
});
}

   

  @override 
  Widget build (BuildContext context){
 getscore();
 UserModel currentuser = getUserByUserId(widget.userid)!;
    return  Scaffold(
       backgroundColor : const Color.fromARGB(255, 0, 0, 0),
       body: Stack(
        children: [
           Positioned(
            top: 130,
            left: 20,
            child: Text(widget.category,style:const TextStyle(color:Colors.white,))
            ),
         const  Positioned(
          top: 150,
          left: 20,
            child:Text("Level",style: TextStyle(color: Colors.white,fontSize: 24),)
             ),
        const  Positioned(
            left:100 ,
            top: 200,
            child: SizedBox(
              width: 300,
              height: 600,
              child: OrangeCard(),
              )
            ),
            
       Positioned(
        top: 300,
        right: 100,
         child: SizedBox(
          height: 530,
          width: 250,
           child: ListView(
            children: [
             
    
             GestureDetector(
              onTap: ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>
                           QuizScreen(category: widget.category,level: 1,userid: widget.userid,))),
              child:const LevelCard(level: "LEVEL 1",open: true,)),
              GestureDetector(
                            onTap: (){
                               if(widget.category=="Dart"){
                             score=currentuser.dartscore[0];
                            }else{
                              score=currentuser.flutterscore[0];
                            }
                             if(score>=15){  
                           Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>
                           QuizScreen(category: widget.category,level: 2,userid: widget.userid,)));
                             }
                             else{
                              //showsnackbar
                              showsnackbar(context,15);
                             }
  }
              
              ,
              child:const LevelCard(level: "LEVEL 2",open: true,)),
              GestureDetector(
              onTap: (){
                if(widget.category=="Dart"){
                             score=currentuser.dartscore[1];
                            }else{
                              score=currentuser.flutterscore[1];
                            }

              if(score>=20){
               Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>QuizScreen(category: widget.category,level: 3,userid: widget.userid,)));
               }
               else{
                //showsnackbar
                showsnackbar(context,20);
               }
               },
               
              
              child: LevelCard(level: "LEVEL 3",open: lock,)
              ),
            ],
           ),
         ),
       ),
          

        ],
       ),
    );
  }
   void showsnackbar(BuildContext context,int? passscore){
    var snackbar=  SnackBar(
      backgroundColor:const Color.fromARGB(255, 244, 67, 54),
      content:  Text("score $passscore to enter next level"),
      duration:const Duration(seconds:3 ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
       

  }
}