import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'questhion.dart';

QuizBrain quizBrain = QuizBrain();
Questhion questhion = Questhion();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.grey.shade800,
          body: SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          )),
        ));
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  //برای برسی و امتیاز دادن به  جواب های سوالات
  List<Icon> scoreList = [];
  //سوالاتی که در صفحه نمیایش داده میشوند
  // List<String> question = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.'
  // ];
  int quizNumber = 0;

  void checkAnswe(bool userPick) {
    bool correctanswer = quizBrain.QuesthionBank[quizNumber].awnser;
    if (correctanswer == userPick) {
      scoreList.add(Icon(Icons.check, color: Colors.green));
    } else {
      scoreList.add(Icon(Icons.close, color: Colors.red));
    }

    setState(() {
      quizNumber++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.QuesthionBank[quizNumber].questhion,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  textStyle: TextStyle(color: Colors.white)),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                checkAnswe(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                checkAnswe(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreList,
        )
      ],
    );
  }
}



/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/

