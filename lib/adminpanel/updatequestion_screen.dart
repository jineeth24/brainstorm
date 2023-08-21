
import 'package:brainstorm/adminpanel/viewquestion_screen.dart';
//import 'package:brainstorm/adminpanel/viewquestionscreen.dart';
// import 'package:brainstorm/components/admindropdown.dart';
// import 'package:brainstorm/components/adminleveldrop.dart';
import 'package:brainstorm/components/mytextfield.dart';
import 'package:brainstorm/db/functions/dbfunctions.dart';
import 'package:brainstorm/db/model/datamodel.dart';

import 'package:flutter/material.dart';

class UpdateQuestionScreen extends StatefulWidget {
  final Quizmodel quizobject;
  const UpdateQuestionScreen({super.key, required this.quizobject});
// final List<Map<String,String>>question;

  @override
  State<UpdateQuestionScreen> createState() => _UpdateQuestionScreenState();
}

class _UpdateQuestionScreenState extends State<UpdateQuestionScreen> {
  late TextEditingController questionController;

  late TextEditingController optionControllerA;

  late TextEditingController optionControllerB;

  late TextEditingController optionControllerC;

  late TextEditingController optionControllerD;

  late TextEditingController answerController;

// List<Map<String,String>>question=[
  List<int> levels = [1,2,3];
  List<String> categories = ["Dart", "Flutter"];

  String? categorydropdownvalue;
  int? leveldropdownvalue;
  var questionlistlength = questionsList.length;

  @override
  void initState() {
    var data = widget.quizobject;
    categorydropdownvalue = data.category;
    leveldropdownvalue = data.level;
    questionController = TextEditingController(text: data.question);
    optionControllerA = TextEditingController(text: widget.quizobject.optionA);
    optionControllerB = TextEditingController(text: widget.quizobject.optionB);
    optionControllerC = TextEditingController(text: widget.quizobject.optionC);
    optionControllerD = TextEditingController(text: widget.quizobject.optionD);
    answerController = TextEditingController(text: widget.quizobject.answer);
    super.initState();
  }

// @override
// void dispose(){
//   questionController.dispose();
//   optionControllerA.dispose();
//   optionControllerB.dispose();
//   optionControllerC.dispose();
//   optionControllerD.dispose();
//   answerController.dispose();
//     super.dispose();

// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Update Question"),
      ),
      body: SafeArea(
        child: Padding(
          padding:const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                width: 320,
                height: 60,
                padding:const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(15)),
                child: DropdownButton(
                    isExpanded: true,
                    value: categorydropdownvalue,
                    hint: const Text("categories"),
                    items: categories.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        categorydropdownvalue = newValue ?? " ";
                      });
                    }),
              ),
             const SizedBox(
                height: 20,
              ),
              Container(
                width: 320,
                height: 60,
                padding:const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(15)),
                child: DropdownButton(
                    isExpanded: true,
                    value: leveldropdownvalue,
                    hint: const Text("Level"),
                    items: levels.map((int items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text("$items"),
                      );
                    }).toList(),
                    onChanged: (int? newValue) {
                      setState(() {
                        leveldropdownvalue = newValue ?? 0;
                      });
                    }),
              ),
              MyTextFormField(
                hintText: "Question",
                controller: questionController,
              ),
              MyTextFormField(hintText: "OptionA", controller: optionControllerA),
              MyTextFormField(hintText: "OptionB", controller: optionControllerB),
              MyTextFormField(
                hintText: "OptionC",
                controller: optionControllerC,
              ),
              MyTextFormField(
                hintText: "OptionD",
                controller: optionControllerD,
              ),
              MyTextFormField(
                hintText: "Answer",
                controller: answerController,
              ),
              TextButton(
                  onPressed: () {
                    onsubmit();
                    // setState(() {
                    //   getallDetails();
                    //    questionlistlength=questionsList.length;
                    // });

                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (ctx) {
                      return const ViewQuestionScreen();
                    }));
                  },
                  child: const Text("submit")),
            ]),
          ),
        ),
      ),
    );
  }

  Future<void> onsubmit() async {
    final category = categorydropdownvalue;
    final level = leveldropdownvalue;
    final question = questionController;
    final optionA = optionControllerA;
    final optionB = optionControllerB;
    final optionC = optionControllerC;
    final optionD = optionControllerD;
    final answer = answerController;

    Quizmodel quest1 = Quizmodel(
        category: category!,
        level: level!,
        question: question.text,
        optionA: optionA.text,
        optionB: optionB.text,
        optionC: optionC.text,
        optionD: optionD.text,
        answer: answer.text);
    
    updateQuestion(widget.quizobject.primarykey, quest1);

    // updateQuestion(quizobject.primary,quest1);

    setState(() {
      questionlistlength = questionsList.length;
    });
  }
}
