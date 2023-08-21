// import 'package:brainstorm/components/mybutton.dart';
import 'package:brainstorm/components/mytextfield.dart';
import 'package:brainstorm/db/functions/dbfunctions.dart';
import 'package:brainstorm/db/model/datamodel.dart';

import 'package:brainstorm/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  //validate
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
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/logo/logo1.png'),

              //const SizedBox(height: 30,),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                margin: EdgeInsets.zero,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Register with us and test your knowledge",
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      MyTextFormField(
                        hintText: "UserName",
                        controller: usernameController,
                        obscureText: false,
                        somevalidator: _validateUsername,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MyTextFormField(
                        hintText: "Password",
                        controller: passwordController,
                        obscureText: true,
                        somevalidator: _validatePassword,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // LoginButton(buttonName: "Sign Up",),
                      GestureDetector(
                        onTap: () {
                          final username = usernameController.text.trim();
                          final password = passwordController.text.trim();
                          if (_formKey.currentState!.validate()) {
                            getAllUserDetails();
                            if (!checkUserExist(username)) {
                              //if user doesnt exist
                              onsignup(username, password);
                              const Duration(seconds: 3);
                              setState(() {});
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => const LoginScreen()));
                            }
                            else{
                              showsnackbar(context);
                             
                            }
                          }
                          //add new user to db,
                        },
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          margin: const EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(15)),
                          child: const Center(
                              child: Text(
                            "SignUp",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                        ),
                      ),
                      const SizedBox(
                        height: 130,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onsignup(String username, String password) {
    UserModel user = UserModel(
      username: usernameController.text,
      password: passwordController.text,
      dartscore: [0, 0, 0],
      flutterscore: [0, 0, 0],
    );
    //print(user.dartscore);
    addUser(user);
  }
 void showsnackbar(BuildContext context){
    const snackbar=  SnackBar(
      backgroundColor: Colors.red,
      content:  Text("Username already exist"),
      duration: Duration(seconds:3 ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
       

  }

}
