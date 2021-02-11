import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app_theflutterway/constants.dart';
import 'package:quiz_app_theflutterway/controllers/question_controller.dart';
import 'package:quiz_app_theflutterway/models/questions.dart';
import 'package:quiz_app_theflutterway/screens/quiz/components/option.dart';

class QuestionCard extends StatelessWidget {

  final Question question;

  final QuestionController _questionController = Get.put(QuestionController());

  QuestionCard({
    Key key, 
    @required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context).textTheme.headline6.copyWith(
              color: kBlackColor
            ),
          ),

          SizedBox(height: kDefaultPadding / 2),

          ...List.generate(
            question.options.length, 
            (index) => Option(
              index: index,
              text: question.options[index],
              press: () => _questionController.checkAnswer(question, index),
            ),
          ),
        ],
      ),
    );
  }
}