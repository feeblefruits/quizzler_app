import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 89, 179, 0.75),
          title: Text(
            'Know your COVID-19',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
              fontFamily: 'Schyler',
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

var alertStyle = AlertStyle(
  animationType: AnimationType.fromTop,
  isCloseButton: false,
  isOverlayTapDismiss: false,
  descStyle: TextStyle(fontFamily: 'Schyler'),
  animationDuration: Duration(milliseconds: 400),
  alertBorder: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(0.0),
    side: BorderSide(
      color: Colors.grey,
    ),
  ),
  titleStyle: TextStyle(
    color: Colors.red,
    fontFamily: 'Schyler',
  ),
);

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  List<int> correctAnswers = [];
  List<int> wrongAnswers = [];

  String finalScore = '';

  void correctAnswerLength() {
    setState(() {
      finalScore =
          ((correctAnswers.length / quizBrain.questionBankLength()) * 100)
              .toStringAsFixed(0);
    });
  }

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();

    if (scoreKeeper.length < quizBrain.questionBankLength()) {
      setState(() {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(Icon(
            Icons.check_circle_outline,
            color: Colors.green,
          ));
          correctAnswers.add(1);
        } else {
          scoreKeeper.add(Icon(
            Icons.block,
            color: Colors.red,
          ));
          wrongAnswers.add(1);
        }
        quizBrain.nextQuestion();
      });
    } else {
      correctAnswerLength();
      Alert(
        style: alertStyle,
        context: context,
        title: "Quiz done!",
        desc: "You got $finalScore% correct",
        buttons: [
          DialogButton(
            child: Text(
              "Restart",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Schyler',
              ),
            ),
            onPressed: () {
              quizBrain.reset();
              Navigator.pop(context);
            },
            color: Color.fromRGBO(0, 89, 179, 0.75),
          ),
          DialogButton(
            child: Text(
              "Quit",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Schyler',
              ),
            ),
            onPressed: () =>
                SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
            color: Color.fromRGBO(0, 89, 179, 0.75),
          )
        ],
      ).show();
      scoreKeeper = [];
      correctAnswers = [];
    }
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
            padding: EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: 'Schyler',
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: DialogButton(
              color: Color.fromRGBO(0, 179, 134, 1.0),
              child: Text(
                'True',
                style: TextStyle(
                  fontFamily: 'Schyler',
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
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
            padding: EdgeInsets.all(12.0),
            child: DialogButton(
              color: Color.fromRGBO(255, 114, 111, 1.0),
              child: Text(
                'False',
                style: TextStyle(
                  fontFamily: 'Schyler',
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
