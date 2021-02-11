import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app_theflutterway/controllers/question_controller.dart';
import 'package:quiz_app_theflutterway/screens/quiz/body.dart';

class QuizScreen extends StatelessWidget {

  final QuestionController _questionController = Get.put(QuestionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // o body vai pegar a parte do appbar tbm, então a imagem de fundo vai funcionar no appbar tbm
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          FlatButton(
            onPressed: _questionController.nextQuestion, 
            child: Text("Skip")
          ),
        ],
      ),
      body: Body(),
    );
  }
}