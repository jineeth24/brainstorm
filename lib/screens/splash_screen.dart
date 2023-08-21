import 'package:brainstorm/screens/home_screen.dart';
import 'package:brainstorm/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

 @override 
 void initState(){
  checkUserLoggedIn();
  super.initState();
 }
 @override 
 void didChangeDependencies(){
  super.didChangeDependencies();
 }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        decoration:const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [
              Colors.black,
              Color.fromARGB(246, 236, 130, 9),
            ])
        ),
        child: Center(
          child: Image.asset("assets/logo/logo1.png"),
        )),
    );
  }

  // @override 
  // void dispose(){
  //   super.dispose();
  // }

  //checking sharedpref so a future function
  Future<void>gotoLogin() async{
   await Future.delayed(
      const Duration(seconds:3 ));
       Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const LoginScreen( )));
  }


  Future<void> checkUserLoggedIn () async{
    final sharedprefs=await SharedPreferences.getInstance();
    final userLoggedIn=sharedprefs.getInt('userid');
    if(userLoggedIn==null){
      gotoLogin();
    }
    else
    {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>HomeScreen(userLoggedIn)));
  }
  }


}
