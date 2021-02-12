import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app_theflutterway/constants.dart';
import 'package:quiz_app_theflutterway/controllers/question_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ScoreScreen extends StatelessWidget {

  final QuestionController _questionController = Get.put(QuestionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          WebsafeSvg.asset(
            "assets/icons/bg.svg",
            fit: BoxFit.fill, 
            width: double.infinity
          ),
          Column(
            children: [
              Spacer(flex: 3),
              Text(
                "Score",
                style: Theme.of(context).textTheme.headline3.copyWith(
                  color: kSecondaryColor
                ),
              ),
              Spacer(),
              Text(
                "${_questionController.numberOfCorrectAnswers * 10}/${_questionController.questions.length * 10}", 
                style: Theme.of(context).textTheme.headline4.copyWith(
                  color: kSecondaryColor
                ),
              ),
              Spacer(flex: 3),
            ],
          ),
        ],
      ),
    );
  }
}