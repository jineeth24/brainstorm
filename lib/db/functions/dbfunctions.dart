import 'package:brainstorm/db/model/datamodel.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

List<Quizmodel> questionsList = List.empty(growable: true);
List<Quizmodel> questionOfLevel = List.empty(growable: true);
List<Quizmodel> questionOfDart = List.empty(growable: true);
List<String> categoryList = List.empty(growable: true);


Future<void> addQuestion(Quizmodel quest1) async {
  final quizdb = await Hive.openBox<Quizmodel>('quizDetails_db');
  final id = await quizdb.add(quest1);
  final value = quizdb.get(id);
  //quest1.primarykey=id;
  await quizdb.put(
      id,
      Quizmodel(
          primarykey: id,
          category: value!.category,
          level: value.level,
          question: value.question,
          optionA: value.optionA,
          optionB: value.optionB,
          optionC: value.optionC,
          optionD: value.optionD,
          answer: value.answer));
  // questionsList.add(quest1);
}

Future<List> getallDetails() async {
  final quizdb = await Hive.openBox<Quizmodel>('quizDetails_db');

  questionsList.clear();
  questionsList.addAll(quizdb.values.toList());
  //

  return questionsList;
 
}


Future<void> deleteQuestion(int? primarykey) async {
  final quizdb = Hive.box<Quizmodel>('quizDetails_db');


  await quizdb.delete(primarykey);

  questionsList.clear();
  questionsList = quizdb.values.toList();
}

Future<void> updateQuestion(int? primekye, quest1) async {
  // if (primekye == null) {
  //   // Handle the case where the primary key is null or invalid
  //   print('error');
  //   return;
  // }
  final quizdb = await Hive.openBox<Quizmodel>('quizDetails_db');

  await quizdb.put(
      primekye,
      Quizmodel(
          primarykey: primekye,
          category: quest1.category,
          level: quest1.level,
          question: quest1.question,
          optionA: quest1.optionA,
          optionB: quest1.optionB,
          optionC: quest1.optionC,
          optionD: quest1.optionD,
          answer: quest1.answer));

  getallDetails();
}

getQuestionOfLevel(String selectedCategory, int selecetedlevel) {
  questionOfLevel = questionsList
      .where((question) =>
          question.category == selectedCategory &&
          question.level == selecetedlevel)
      .toList();
 // print(questionOfLevel);
}
//find score percent
 double scorePercent(int score){
  var total=score/(questionOfLevel.length*5);
  double percentage =total*100;
  return percentage;

 }

getDartQuestions() {
  questionOfDart =
      questionsList.where((question) => question.category == "Dart").toList();
 // print(questionOfLevel);
}

//usermodel functions////////////////////////////













List<UserModel> userList = List.empty(growable: true);

//sign up functions
Future<void> addUser(UserModel user) async {
  final userbox = await Hive.openBox<UserModel>('user_db');
  final userID = await userbox.add(user);
  //final value =  userbox.get(userID);
  final newUser = UserModel(
    username: user.username,
     password: user.password,
     userid: userID,
     dartscore: [0,0,0],
     flutterscore: [0,0,0],
     );
  await userbox.put(userID, newUser);
}
 //chech user already exist





//login functions
Future<List<UserModel>> getAllUserDetails() async {
  final userbox = await Hive.openBox<UserModel>('user_db');
  userList.clear();
  userList.addAll(userbox.values.toList());
 // print(userList);
  return userList;
}

//check user already exist
 bool checkUserExist(String username) {
  bool uservalid = userList
      .any((user) => user.username == username);
     return uservalid;

      }

 int? checkUser(String username, String password) {
  bool uservalid = userList
      .any((user) => user.username == username && user.password == password);
      //print(uservalid);
//return uservalid;
  if(uservalid){
    final  currentuser1=userList.firstWhere((user) =>  user.username == username && user.password == password);
    final id=currentuser1.userid;
    // print(currentuser1.username);
    // print(id);
    return id;
  }
  else{
    return null;
  }
 
  }

UserModel? getUserByUserId(int userid) {
  getAllUserDetails();
  try {
    return userList.firstWhere((user) => user.userid == userid);
  } catch (e) {
    // If the user with the given userid is not found, return null
    return null;
  }
}




//List<ScoreModel> scoreList = List.empty(growable: true);

//add score to db

Future<void> addScore(int userid,int newscore,String category,int level)async{
  final userbox=await Hive.openBox<UserModel>('user_db');
  final currentuser=userbox.get(userid)!;
  //find which level and category
 
  if(category=="Dart"&&newscore>currentuser.dartscore[level-1]){
   List <int> newdartscore=[...currentuser.dartscore];
   newdartscore[level-1]=newscore;
    userbox.put(userid, UserModel(
    username: currentuser.username,
     password:currentuser. password,
     userid: currentuser.userid,
     dartscore: newdartscore,
     flutterscore: currentuser.flutterscore,
     attempt: currentuser.attempt+1,
     ));
  }
  else if(category=="Flutter"&&newscore>currentuser.flutterscore[level-1]){
   List <int> newflutterscore=[...currentuser.dartscore];
   newflutterscore[level-1]=newscore;
    userbox.put(userid, UserModel(
    username: currentuser.username,
     password:currentuser. password,
     userid: currentuser.userid,
     dartscore: currentuser.dartscore,
     flutterscore: newflutterscore,
     attempt: currentuser.attempt+1,
     ));
  }
  }















