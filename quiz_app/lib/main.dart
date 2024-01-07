import 'package:flutter/material.dart';
import 'result.dart';
import 'quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  final _question = const [
    {
      'questionText': 'what \'s your favourite colour?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'Blue', 'score': 1}
      ],
    },
    {
      'questionText': 'what \'s your favourite animal?',
      'answers': [
        {'text': 'Cat', 'score': 1},
        {'text': 'Tiger', 'score': 10},
        {'text': 'Lion', 'score': 8},
        {'text': 'Rabbit', 'score': 3}
      ]
    },
    {
      'questionText': 'what \'s your favourite instructor?',
      'answers': [
        {'text': 'Alan', 'score': 8},
        {'text': 'David', 'score': 5},
        {'text': 'Richard', 'score': 1},
        {'text': 'Steven', 'score': 3}
      ]
    },
    {
      'questionText': 'what \'s your favourite food?',
      'answers': [
        {'text': 'KFC', 'score': 10},
        {'text': 'MCD', 'score': 5},
        {'text': 'Nasi Lemak', 'score': 3},
        {'text': 'Briyani', 'score': 1}
      ]
    }
  ];

  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text('My Quiz App'),
        ),
        body: _questionIndex < _question.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                question: _question,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
