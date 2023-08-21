import 'package:flutter/material.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

 final String privacyText1="This Privacy Policy explains how we collect, use, and protect your personal information when you use our quiz app. By using our app, you consent to the practices described in this policy.";
 final String privacyText2=" When you create an account, we collect your chosen username and password. This information is stored locally on your device and is not shared with us or any third parties. We use your username and password solely for the purpose of authenticating your login and allowing you to access your account.";
 final String privacyText3="We take data security seriously and implement reasonable security measures to protect your information. However, please be aware that no method of transmission over the internet or electronic storage is completely secure.";
static  const  TextStyle privacytextstyle=TextStyle(fontSize: 18);
static const double heading=20;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("BrainStorm"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              //mainAxisSize: MainAxisSize.min,
              children: [
               const Text("Privacy Policy",style:TextStyle(fontSize: heading,fontWeight: FontWeight.bold),),
               //const SizedBox(height: 20,),
               const Text("12 August 2023",style:TextStyle(fontSize: heading),),
               //const SizedBox(height: 20,),
               const Text("Welcome to Brainstorm",style:TextStyle(fontSize: heading),),
               //const SizedBox(height: 20,),
              Text(privacyText1,style: privacytextstyle,),
              Text(privacyText2,style: privacytextstyle,),
              Text(privacyText3,style: privacytextstyle),
        
              ]
            ),
          ),
        ),
      ),
    );
  }
}
