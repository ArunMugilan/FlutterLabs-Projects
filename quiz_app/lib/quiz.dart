import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';


class Quiz extends StatelessWidget {
  final List<Map<String, Object>> question;
  final int questionIndex;
  final Function answerQuestion;

  const Quiz({Key? key,
    required this.question,
    required this.answerQuestion,
    required this.questionIndex
  })
      : super (key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(question[questionIndex]['questionText'] as String,
        ),
        ...(question[questionIndex]['answers'] as List<String>).map((answer) {
          return Answer(
                  () => answerQuestion(answer['score']), answer['text'].toString());
          }).toList(),
      ],
    );
  }


}