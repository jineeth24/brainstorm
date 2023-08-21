
import 'package:brainstorm/components/categorycard.dart';
import 'package:brainstorm/db/functions/dbfunctions.dart';
import 'package:brainstorm/screens/about_screen.dart';
import 'package:brainstorm/screens/level_screen.dart';
import 'package:brainstorm/screens/login_screen.dart';
import 'package:brainstorm/screens/privacy_screen.dart';
import 'package:brainstorm/screens/score_board.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../db/model/userdetails.dart';

class HomeScreen extends StatefulWidget{
  final int userid;

  const HomeScreen(this.userid, {super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String sub1="Dart";

  final String sub2="Flutter";
  List? score;
  int attempt=0;

 // final userlis=getUserDetails();
 @override
 void initState() {
    
    super.initState();
    addcurrentuser( widget.userid);
    updateUserData();
 }
     void updateUserData() {
    final currentuser = getUserByUserId(widget.userid);
    setState(() {
      score = currentuser?.dartscore;
      attempt = currentuser?.attempt ?? 0;
    });
    //  score=currentuser!.dartscore;
    //  attempt=currentuser.attempt;
  }
  @override 
  Widget build (BuildContext context){
    updateUserData();
    // addcurrentuser( widget.userid);

     final currentuser=getUserByUserId(widget.userid);
      return Scaffold(
        
        appBar: AppBar(backgroundColor: Colors.black45),
        drawer: Drawer(
          
           child: ListView(
             children: [
             const DrawerHeader(
                child: Text("brainStorm",style: TextStyle(fontSize: 20),)),
            
              ListTile(
                leading:const Icon(Icons.scoreboard_outlined),
                title:const Text("Score Board"),
                onTap:  
                
                (){Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> ScoreBoardScreen(userid:widget.userid)));},
              ),
               ListTile(
                leading: const Icon(Icons.settings_outlined),
                title: const Text("Logout"),
                onTap: () {
                  //show popup
                  showLogoutDialog(context);
                 
                },
              ),
               ListTile(
                leading: const Icon(Icons.privacy_tip_outlined),
                title:const Text("Privacy"),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const PrivacyScreen()));
                },
              ),
               ListTile(
                leading:const Icon(Icons.info_outline),
                title:const Text("About"),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const AboutScreen()));
                },
              ),
           

             ],
           ),    
        ),
         backgroundColor:const Color.fromARGB(255, 0, 0, 0),
         body: Stack(
          children: [
            Positioned(
            top: 20,
            left: 20,
              child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Text(pass,style:const TextStyle(color: Colors.white,fontSize: 24),),
                   Text("welcome  ${currentuser!.username} ",style:const TextStyle(color: Colors.white,fontSize: 20),),
                   
                  ],
                ),
           
               ),
 
            Positioned(
              right:100 ,
              top: 180,
              child: SizedBox(
                width: 300,
                height: 440,
                
                child: Card(
                  color:const  Color.fromARGB(255, 247, 175, 68),
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                  
                  ),
                )
              ),
              
         Positioned(
          top: 210,
          left: 60,
           child:  SizedBox(
            height: 530,
            width: 350,
             child: ListView(
              children: [
               
      
                  GestureDetector(
                    onTap: () {
                       //selected first cat, get levels where cat=dart
                       Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=> LevelScreen(category:sub1,userid: widget.userid,)));
                    },
                    child:const CategoryCard(categoryimage: "assets/dart.jpg",),
                 
                    ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>LevelScreen(category:sub2,userid: widget.userid,))),
                    child:const CategoryCard(categoryimage: "assets/flutter.jpg",),
                    
                    ),
                 
                
           
              ],
             ),
           ),
         ),
            

          ],
         ),
      );
  }
   signout(BuildContext ctx)async{

    final sharedprefs= await SharedPreferences.getInstance();
    sharedprefs.clear();

     Navigator.of(ctx).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx1)=>const LoginScreen()), (route) => false); 

  }

//show logout popup

void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:const Text(' Logout'),
          content:const Text('Do you want to Logout?'),
          actions: <Widget>[
             TextButton(
              onPressed: () {
                 
              Navigator.of(context).pop(); // Close the dialog
              },
              child:const Text('NO'),
            ),
            TextButton(
              onPressed: () {
                 signout(context);
                //Navigator.of(context).pop(); // Close the dialog
              },
              child:const Text('YES'),
            ),
          ],
        );
      },
      
    );
  }


}