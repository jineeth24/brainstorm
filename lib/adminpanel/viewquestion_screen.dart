import 'package:brainstorm/adminpanel/addquestion_screen.dart';
import 'package:brainstorm/adminpanel/updatequestion_screen.dart';
import 'package:brainstorm/db/functions/dbfunctions.dart';
import 'package:brainstorm/screens/login_screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ViewQuestionScreen extends StatefulWidget {
  final listviewcount;
  const ViewQuestionScreen([this.listviewcount]);

  @override
  State<ViewQuestionScreen> createState() => _ViewQuestionScreenState();
}

class _ViewQuestionScreenState extends State<ViewQuestionScreen> {
  var listviewcount = questionsList.length;

  @override
  void initState() {
    super.initState();
    getallDetails();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('ADMIN'),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {
                showLogoutDialog(context);
              },
              icon: const Icon(Icons.logout),
            ),
          ]),
      body: FutureBuilder<void>(
          future: getallDetails(),
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: questionsList.length,
                  itemBuilder: (context, index) {
                    final data = questionsList[index];
                    return Container(
                      width: double.infinity,
                      // height: 245,
                      padding: const EdgeInsets.all(10),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Category :${data.category}",
                                style: const TextStyle(color: Colors.black),
                              ),
                              Text("Level :${data.level}"),
                              Text(
                                "Question :${data.question},",
                                style: const TextStyle(
                                    color: Colors.blue, fontSize: 16),
                              ),
                              Text("Option A :${data.optionA}"),
                              Text("Option B :${data.optionB}"),
                              Text("Option C :${data.optionC}"),
                              Text("Option D :${data.optionD}"),
                              Text(
                                "Answer : ${data.answer}",
                                style: const TextStyle(color: Colors.green),
                              ),
                              Row(
                                children: [
                                  //deletebutton
                                  IconButton(
                                      onPressed: () async {
                                        await deleteQuestion(data.primarykey);
                                        setState(() {
                                          listviewcount = questionsList.length;
                                        });
                                      },
                                      icon: const Icon(Icons.delete)),

                                  //update button
                                  IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(builder: (ctx) {
                                        return UpdateQuestionScreen(
                                          quizobject: data,
                                        );
                                      }));
                                    },
                                    icon: const Icon(
                                      Icons.edit_outlined,
                                      color: Colors.red,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return const CircularProgressIndicator();
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (ctx) {
            return const AddQuestionScreen();
          }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(' Logout'),
          content: const Text('Do you want to Logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('NO'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (ctx1) => const LoginScreen()),
                    (route) => false);
                //Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('YES'),
            ),
          ],
        );
      },
    );
  }
}
