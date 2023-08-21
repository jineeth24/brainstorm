import 'package:hive_flutter/hive_flutter.dart';
part 'datamodel.g.dart';


// class Quizmodel {
//   String category;
//   String level;
//   String question;
//   String optionA;
//   String optionB;
//   String optionC;
//   String optionD;
//   String answer;

//   Quizmodel(
//   {required this.category,
//   required this.level,
//   required this.question,
//   required this.optionA,
//   required this.optionB,
//   required this.optionC,
//   required this.optionD,
//   required this.answer
  
//   }
//   );
// }


@HiveType(typeId: 0)
class UserModel{
  @HiveField(0)
  String username;
  @HiveField(1)
  String password;
  @HiveField(2)
  int attempt;
  @HiveField(3)
  int? userid;
   @HiveField(4)
   List dartscore;
   @HiveField(5)
   List flutterscore;
  //  int dartscore2;
  //  @HiveField(6)
  //  int dartscore3;
  //  @HiveField(7)
  //  int flutterscore1;
  //   @HiveField(8)
  //  int flutterscore2;
  //   @HiveField(9)
  //  int flutterscore3;

  

   UserModel(
     
    {
    required this.username,
    required this.password,
    required this.dartscore,
    required this.flutterscore,
    this.attempt = 0,
    this.userid,  
    //this.scoreobject=ScoreModel(use),
    
    // this.dartscore1=0,
    // this.dartscore2=0,
    // this.dartscore3=0,
    // this.flutterscore1=0,
    // this.flutterscore2=0,
    // this.flutterscore3=0,
    // 
  });
}


@HiveType(typeId: 2)
class ScoreModel{
  @HiveField(0)
  int? userid;
  @HiveField(1)
  String category;
   @HiveField(2)
   List dartscore;
  //  int dartscore1;
   @HiveField(3)
   List flutterscore;
  //  int dartscore2;
  //  @HiveField(4)
  //  int dartscore3;
  //   @HiveField(5)
  //  int flutterscore1;
  //   @HiveField(6)
  //  int flutterscore2;
  // @HiveField(7)
  // int flutterscore3;
  // int L1score;
  // @HiveField(3)
  // int L2score;
  // @HiveField(4)
  // int L3score;

  ScoreModel({
    required this.userid,
    required this.category,
     required this.dartscore,
   // this.dartscore2=0,
    // this.dartscore3=0,
    // this.flutterscore1=0,
    // this.flutterscore2=0,
    required this.flutterscore,
    // required this.L1score,
    // required this.L2score,
    // required this.L3score
    
  });

}




@HiveType(typeId:1)
class Quizmodel {
  @HiveField(0)
  String category;
  @HiveField(1)
  int level;
  @HiveField(2)
  String question;
  @HiveField(3)
  String optionA;
  @HiveField(4)
  String optionB;
  @HiveField(5)
  String optionC;
  @HiveField(6)
  String optionD;
  @HiveField(7)
  String answer;
  @HiveField(8)
  int? primarykey;

  Quizmodel(
  {
  this.primarykey,
  required this.category,
  required this.level,
  
  required this.question,
  required this.optionA,
  required this.optionB,
  required this.optionC,
  required this.optionD,
  required this.answer,
  
  
  }
  );
}