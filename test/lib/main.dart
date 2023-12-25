import 'package:flutter/material.dart';
import 'app_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

AppBrain appBrain = AppBrain();

void main() {
  runApp(ExamApp());
}

class ExamApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.blue[800],
          title: Text('Test'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ExamPage(),
        ),
      ),
    );
  }
}

class ExamPage extends StatefulWidget {
  @override
  _ExamPageState createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  List<Widget> answerResult = []; //add icons
  int rightAnswers = 0; // sum num anserwer true

  void checkAnswer(bool whatUserPicked) {
    // appBrain.questionGroup[questionNumber].questionAnswer = false;
    bool correctAnswer = appBrain.getQuestionAnswer();
    setState(() {
      if (whatUserPicked == correctAnswer) {
        rightAnswers++;
        answerResult.add(
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Icon(
              Icons.thumb_up,
              color: Colors.blue[800],
            ),
          ),
        );
      } else {
        answerResult.add(
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Icon(
              Icons.thumb_down,
              color: Color.fromARGB(255, 224, 29, 15),
            ),
          ),
        );
      }
      if (appBrain.isFinished() == true) {
        Alert(
          context: context,
          title: "Test finished",
          // title: "انتهاء الاختبار",
          desc: "You answered $rightAnswers  questions correctly out of 7",
          //desc: "لقد أجبت على $rightAnswers أسئلة صحيحة من أصل 7",
          style: AlertStyle(
            backgroundColor: Colors.white, // Set the background color
            titleStyle: TextStyle(
              color:
                  Color.fromARGB(255, 224, 29, 15), // Set the title text color
              fontSize: 24.0,
            ),
            descStyle: TextStyle(
              color: Color.fromARGB(
                  255, 224, 29, 15), // Set the description text color
              fontSize: 18.0,
            ),
          ),
          buttons: [
            DialogButton(
              color: Colors.blue[800],
              highlightColor: Colors.blue,
              child: Text(
                "start again",
                //"ابدأ من جديد",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();

        appBrain.reset(); // num=0 gome back first

        answerResult = []; //dellete icons

        rightAnswers = 0; // anserwers true=0
      } else {
        appBrain.nextQuestion(); //next  question
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: answerResult,
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Image.asset(appBrain.getQuestionImage()),
              SizedBox(height: 20.0),
              Text(
                appBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.blue[800], // Set the background color here
              ),
              child: Text(
                'Correct',
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(
                    255, 224, 29, 15), // Set the background color here
              ),
              child: Text(
                'Incorrect',
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
      ],
    );
  }
}
