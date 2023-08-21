//import 'package:brainstorm/adminpanel/viewquestionscreen.dart';
//import 'package:brainstorm/components/orangecard.dart';
import 'package:brainstorm/db/functions/dbfunctions.dart';
import 'package:brainstorm/db/model/userdetails.dart';
import 'package:brainstorm/screens/home_screen.dart';
import 'package:brainstorm/screens/answer_screen.dart';
//import 'package:brainstorm/screens/levelscreen.dart';
import 'package:flutter/material.dart';

class ScoreScreen extends StatelessWidget{
   final String category;
  final int level;
 final int userid;
  final int score;


 const ScoreScreen(this.score,{super.key, required this.category, required this.level,required this.userid});

 
  @override 
  Widget build(BuildContext context){
  String congratsimage;
    if(score>=20)
    { congratsimage="assets/congrats1.png";}
    else if(score>=15&&score<20)
    {  congratsimage="assets/tryagain.jpg";

    }else{
 congratsimage="assets/oops.png";
    }
   
    

    final userid=currentuserData.last;
    //addscore
    return Scaffold(
      
      body: Center(
        child: Container(
          color:const Color.fromARGB(255, 3, 25, 63),
          width: double.infinity,
          child: Stack(
              children: [
               
              
                  const Positioned(
                  top: 480,
                  left: 100,
                  child: Text("Total score :",style: TextStyle(color: Colors.orange,fontSize: 25),),),
                  Positioned(
                  top: 480,
                  left: 270,
                    child: Text("$score",style:const TextStyle(color: Colors.orange,fontSize: 25),)),
                  Positioned(
                  top: 50,
                  left: 5,
                  child:Container(
                    width: 380,
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: 
                       DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(congratsimage),
                        ),
                        
                       ),
                    ),
                    
                  )
        
                  ,
        
                    Positioned(
                      top: 700,
                      left: 100,
                    child:   ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.orange)),
                    onPressed: (){Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>HomeScreen(userid)));},
                     child:const Text("HOME "))),
                      Positioned(
                      top: 700,
                      right: 90,
                    child:   ElevatedButton(
                       style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.orange)),
                    onPressed: (){
                      final scorepercent=scorePercent(score);
                      if(scorepercent>=80){
                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>AnswerScreen(category:category,level: level,userid: userid,)));
                      }
                      else{
                        showsnackbar(context,scorepercent);
                      }
                    },
                     child:const Text("ANSWERS")))
        
              ],
            ),
        ),
        ),
      
    );
  }
  void showsnackbar(BuildContext context,scorepercent){
  const   snackbar=  SnackBar(
      backgroundColor: Colors.red,
      content:  Text("score above 80% to view the answers "),
      duration: Duration(seconds:3 ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
       

  }
  
}