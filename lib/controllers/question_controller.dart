import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quiz_app_theflutterway/models/questions.dart';
import 'package:quiz_app_theflutterway/screens/score/score_screen.dart';

class QuestionController extends GetxController with SingleGetTickerProviderMixin {

  AnimationController _animationController;
  
  Animation _animation;
  Animation get animation => this._animation;

  PageController _pageController;
  PageController get pageController => _pageController;

  List<Question> _questions = sample_data
      .map((question) => Question(
        id: question['id'],
        question: question['question'],
        options: question['options'],
        answer: question['answer_index']
      )).toList();
  
  List<Question> get questions => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  int _correctAnswer;
  int get correctAnswer => this._correctAnswer;

  int _selectedAnswer;
  int get selectedAnswer => this._selectedAnswer;

  RxInt _questionNumber = 1.obs;
  int get questionNumber => this._questionNumber.value;

  int _numberOfCorrectAnswers = 0;
  int get numberOfCorrectAnswers => this._numberOfCorrectAnswers;

  @override
  void onInit() {

    // Our animation duration is 60 s
    // So our plan is to fill the progress bar within 60s
    _animationController = AnimationController(
      duration: Duration(seconds: 60),
      vsync: this
    );

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(_animationController)
        ..addListener(() {
          // update like setState
          update();
        });

    // Start animation
    _animationController.forward().whenComplete(nextQuestion);

    _pageController = PageController();

    super.onInit();
  }

  // called just before the Controller is deleted from memory
  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAnswer(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAnswer = question.answer;
    _selectedAnswer = selectedIndex;

    if(_correctAnswer == _selectedAnswer) _numberOfCorrectAnswers++;

    // Stop the counter
    _animationController.stop();

    update();

    Future.delayed(Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if(_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
        duration: Duration(milliseconds: 250), 
        curve: Curves.ease
      );

      // Reseta o contador
      _animationController.reset();

      // Aciona o contador novamente
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      Get.to(ScoreScreen());
    }
  }

  void updateTheQuestionNumber(int index) {
    _questionNumber.value = index + 1;
  }
}