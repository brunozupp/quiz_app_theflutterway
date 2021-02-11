import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app_theflutterway/constants.dart';
import 'package:quiz_app_theflutterway/controllers/question_controller.dart';

class Option extends StatelessWidget {

  final String text;
  final int index;
  final VoidCallback press;

  const Option({
    Key key, 
    this.text, 
    this.index, 
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
      init: QuestionController(),
      builder: (qnController) {

        Color getTheRightColor() {
          if(qnController.isAnswered) {
            if(index == qnController.correctAnswer) {
              return kGreenColor;
            } else if(index == qnController.selectedAnswer 
                && qnController.selectedAnswer != qnController.correctAnswer) {
              
              return kRedColor;
            }
          }
          return kGrayColor;
        }

        IconData getTheRightIcon() {
          return getTheRightColor() == kRedColor
              ? Icons.close
              : Icons.done;
        }

        return InkWell(
          onTap: press,
          child: Container(
            margin: EdgeInsets.only(top: kDefaultPadding),
            padding: EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
              border: Border.all(
                color: getTheRightColor(),
              ),
              borderRadius: BorderRadius.circular(15)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${index + 1}. $text",
                  style: TextStyle(
                    color: getTheRightColor(),
                    fontSize: 16
                  ),
                ),
                Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    color: getTheRightColor() == kGrayColor
                        ? Colors.transparent
                        : getTheRightColor(),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: getTheRightColor(),
                    ),
                  ),
                  child: !(getTheRightColor() == kGrayColor)
                      ? Icon(
                        getTheRightIcon(), 
                        size: 16
                      )
                      : null,
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}