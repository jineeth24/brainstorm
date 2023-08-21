import 'package:brainstorm/db/functions/dbfunctions.dart';

import 'package:flutter/material.dart';

class ScoreBoardScreen extends StatefulWidget {
  final int userid;

  const ScoreBoardScreen({super.key, required this.userid});

  @override
  State<ScoreBoardScreen> createState() => _ScoreBoardScreenState();
}

class _ScoreBoardScreenState extends State<ScoreBoardScreen> {
  int usercount = 0;



  @override
  Widget build(BuildContext context) {
  
    usercount = userList.length;

    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        title: const Text("ScoreBoard"),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: Container(
                width: double.infinity,
                height: 38,
                color : const Color.fromARGB(255, 123, 170, 241),
                padding:const EdgeInsets.all(1),
                child: Table(
                 
                  children: const [
                    TableRow(
                      
                      decoration: BoxDecoration(
                        
                        color: Colors.blue,
                      ),
                      children: [
                      
                      Text(
                        "User",
                        style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 0,
                      ),
                      Text(
                        "Score", 
                        style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                      SizedBox(
                        width: 1,
                      ),
                      Text(
                        "Attempt",
                        style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),
                      ),
                    ]),
                    TableRow(
                      decoration: BoxDecoration(
                        color: Colors.blue
                      ),
                      children: [
                        SizedBox(
                          width: 1,
                        ),
                        Text("Level 1"),
                        //
                        Text("Level 2"),
                        Text("Level 3"),
                        SizedBox(
                          width: 1,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 600,
              width: double.infinity,
              child: FutureBuilder<void>(
                  future: getAllUserDetails(),
                  builder:
                      (BuildContext context, AsyncSnapshot<void> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return ListView.builder(
                          itemCount: usercount,
                          itemBuilder: (context, index) {
                            final user = userList[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 5),
                              child: Container(
                                  width: double.infinity,
                                  height: 40,
                                  
                                  color:const Color.fromARGB(255, 202, 224, 241),
                                  padding: const EdgeInsets.all(10),
                                  child: Table(
                                    
                                    children: [
                                      TableRow(children: [
                                        Text(user.username),
                                        Text("${user.dartscore[0]}"),
                                        Text("${user.dartscore[1]}"),
                                        Text("${user.dartscore[2]}"),
                                        Text("${user.attempt}"),
                                       
                                      ]),
                                    ],
                                  )),
                            );
                          });
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
