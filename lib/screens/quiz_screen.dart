import 'dart:async';
import 'package:brainstorm/components/optioncard.dart';

import 'package:brainstorm/db/functions/dbfunctions.dart';

import 'package:brainstorm/screens/score_screen.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  final String category;
  final int level;
  final int userid;

  const QuizScreen(
      {super.key,
      required this.category,
      required this.level,
      required this.userid});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<int> scorelist = [];
  int score = 0;

  int timer = 50;
  String showtimer = "50";
  bool canceltimer = false;
  Color textColor = const Color.fromARGB(255, 93, 38, 223);
  @override
  void initState() {
    startTimer();
    super.initState();
    getQuestionOfLevel(widget.category, widget.level);
    refreshquestion();
  }

  Future refreshquestion() async {
    await getQuestionOfLevel(widget.category, widget.level);
  }

  var questionNumber = 0;

  void nextQuestion() {
    canceltimer = false;
    setState(() {
      if (questionNumber <= questionOfLevel.length) {
        questionNumber++;
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (ctx) => ScoreScreen(
                  score,
                  category: widget.category,
                  level: widget.level,
                  userid: widget.userid,
                )));
      }
    });
    //startTimer();
  }

  void previousQuestion() {
    setState(() {
      if (questionNumber > 0 && questionNumber < questionOfLevel.length) {
        questionNumber--;
        scorelist.removeLast();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (questionOfLevel.isEmpty) {
      return const Scaffold(
        body: Center(
            child: Text("Please add questions by logging in as \n admin with password admin")),
      );
    } else {
      return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(255, 247, 175, 68),
                ),
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 96, 169, 194),
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25),
                            bottom: Radius.circular(0)),
                      ),
                      width: double.infinity,
                      height: 250,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Category ${widget.category}",
                            style: TextStyle(
                              fontSize: 22,
                              color: textColor,
                            ),
                          ),
                          Text(
                            'Level :${widget.level}',
                            style: const TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 93, 38, 223)),
                          ),
                        ],
                      )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      //question row
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${questionNumber + 1}:  ",
                            style: TextStyle(fontSize: 20, color: textColor),
                          ),
                          SizedBox(
                              width: double.infinity,
                              child: Text(
                                questionOfLevel[questionNumber].question,
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 18,
                                ),
                              )),
                        ],
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          // nextQuestion();
                          setState(() {
                            final data = questionOfLevel[questionNumber];
                            updatestate(data.optionA, data.answer);
                            // final data = questionOfLevel[questionNumber];

                            // checkanswer(data.optionA, data.answer);

                            // if (questionNumber < questionOfLevel.length - 1) {
                            //   questionNumber++;
                            // } else {
                            //   showscore();
                            // }
                          });
                        },
                        child: OptionCard(
                          optionNumber: "A",
                          optinValue:
                              " ${questionOfLevel[questionNumber].optionA}",
                        )),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          final data = questionOfLevel[questionNumber];
                          updatestate(data.optionB, data.answer);
                        });
                      },
                      child: OptionCard(
                        optionNumber: "B",
                        optinValue:
                            " ${questionOfLevel[questionNumber].optionB}",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          final data = questionOfLevel[questionNumber];
                          updatestate(data.optionC, data.answer);
                        });
                      },
                      child: OptionCard(
                        optionNumber: "C",
                        optinValue:
                            " ${questionOfLevel[questionNumber].optionC}",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          final data = questionOfLevel[questionNumber];
                          updatestate(data.optionD, data.answer);
                        });
                      },
                      child: OptionCard(
                        optionNumber: "D",
                        optinValue:
                            " ${questionOfLevel[questionNumber].optionD}",
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 40,
                        child: Text(
                          showtimer,
                          style:
                              const TextStyle(fontSize: 30, color: Colors.red),
                        )),
                    TextButton(
                      child: const Text("go back"),
                      onPressed: () {
                        previousQuestion();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ));
    }
  }

  void startTimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      // setState(() {
      //   if (timer < 1) {
      //     t.cancel();
      //    // nextQuestion();
      //   } else if (canceltimer == true) {
      //     t.cancel();
      //   } else {
      //     timer = timer - 1;
      //   }
      //   showtimer = timer.toString();
      // });
    });
  }

  void checkanswer(String selectedanswer, String answer) {
    //List <int> lastscore=[];
    if (selectedanswer == answer) {
      scorelist.add(5);
      // return lastscore;
    } else {
      scorelist.add(0);
      // return lastscore=0;
    }
  }

  void showscore() {
    startTimer();
    canceltimer = true;
    score = scorelist.reduce((a, b) => a + b);

    //add this score to db
    //addScore(widget.userid, score,widget.category,widget.level);
    addScore(widget.userid, score, widget.category, widget.level);

    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (ctx) => ScoreScreen(
              score,
              userid: widget.userid,
              category: widget.category,
              level: widget.level,
            )));
  }

  void updatestate(String selectedanswer, String answer) {
    //final data = questionOfLevel[questionNumber];
    checkanswer(selectedanswer, answer);
    if (questionNumber < questionOfLevel.length - 1) {
      questionNumber++;
    } else {
      showscore();
    }
  }
}
