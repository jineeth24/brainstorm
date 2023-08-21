import 'package:brainstorm/adminpanel/viewquestion_screen.dart';

import 'package:brainstorm/components/mytextfield.dart';
import 'package:brainstorm/db/functions/dbfunctions.dart';
import 'package:brainstorm/db/model/datamodel.dart';
import 'package:brainstorm/screens/home_screen.dart';
import 'package:brainstorm/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  //navigator

  //validation
  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your username';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    getAllUserDetails();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/logo/logo1.png'),
              const Text(
                " Login",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              // const SizedBox(height: 20,),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      MyTextFormField(
                        hintText: "UserName",
                        controller: nameController,
                        somevalidator: _validateUsername,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MyTextFormField(
                        hintText: "Password",
                        somevalidator: _validatePassword,
                        controller: passwordController,
                        obscureText: true,
                      ),
                    ],
                  )),
           
              const SizedBox(
                height: 10,
              ),

              // const  LoginButton(buttonName: "Sign In",),
              GestureDetector(
                // onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>HomeScreen()));},
                onTap: () {
                  final username = nameController.text.trim();
                  final password = passwordController.text.trim();

                  login(context, username, password);
                },

                child: Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Center(
                      child: Text(
                    "Sign In",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              //dont have account? signup
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    " Don't have an accont? ",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => const SignUpScreen()));
                      },
                      child: const Text(
                        " SignUp",
                        style: TextStyle(
                            color: Color.fromARGB(255, 48, 151, 235),
                            fontSize: 18),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  //login function
  login(context, String username, String password) {
    //getAllUserDetails();
    if (_formKey.currentState!.validate()) {
      if (username == "admin" && password == "admin") {
       
        setState(() {});
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => const ViewQuestionScreen()));
      }
      // else if (username == "user" && password == "user") {
      //   onsignup(username,password);
      //    final validuserid = checkUser(username, password);
       
      //   setState(() {});
      //   if(validuserid!=null){
      //     Navigator.of(context)
      //       .push(MaterialPageRoute(builder: (ctx) =>  HomeScreen(validuserid)));
      //   }
      // }
      
      
       else {
        final validuserid = checkUser(username, password);
        if (validuserid != null) {
          //go home

          savelogin(validuserid); //save the userid to sharedprefs
          setState(() {});
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (ctx) => (HomeScreen(validuserid))));
        } else {
          //no userfound
          showsnackbar(context);          //Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>(LevelScreen())));
          //return;
        }
      }
    }
  }

  //savetoshared
  Future<void> savelogin(int userid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('userid', userid);
  }
//
  void showsnackbar(BuildContext context) {
    const snackbar = SnackBar(
      elevation: 10,
      
      backgroundColor: Colors.red,
      content: Text("no user found"),
      duration: Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
//    void onsignup(String username, String password) {
//     UserModel user = UserModel(
//       username: username,
//       password: password,
//       dartscore: [0, 0, 0],
//       flutterscore: [0, 0, 0],
//     );
//     //print(user.dartscore);
//     addUser(user);
// }
}
