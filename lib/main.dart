// import 'package:brainstorm/adminpanel/adminhome.dart';
import 'package:brainstorm/db/functions/dbfunctions.dart';
import 'package:brainstorm/db/model/datamodel.dart';
import 'package:brainstorm/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  
  await Hive.initFlutter();
   if(!Hive.isAdapterRegistered(UserModelAdapter().typeId)){
  Hive.registerAdapter(UserModelAdapter());
   }
   await Hive.openBox<UserModel>('user_db');
  getAllUserDetails();
  //quizmodel
  if (!Hive.isAdapterRegistered(QuizmodelAdapter().typeId)) {
    Hive.registerAdapter(QuizmodelAdapter());
  }
  await Hive.openBox<Quizmodel>('quizDetails_db');
  getallDetails();
  //default user
   UserModel user = UserModel(
      username: "user",
      password: "1111",
      dartscore: [0, 0, 0],
      flutterscore: [0, 0, 0],
    );
    //print(user.dartscore);
    addUser(user);
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override 
  Widget build(BuildContext context){
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
     
      home: SplashScreen(),
    );
  }
}