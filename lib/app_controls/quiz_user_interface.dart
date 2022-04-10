import 'package:futurama/app_controls/progress_indicator.dart';
import 'package:futurama/app_controls/question_card.dart';
import 'package:futurama/app_pages/q3_page_widget.dart';
import 'package:futurama/app_pages/q4_page_widget.dart';
import '../backend/api_requests/api_calls.dart';
import '../app_controls/flutter_theme.dart';
import '../app_controls/flutter_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class QuizUIWidget extends StatefulWidget {
  final int score;
  final rightAnswer;
  final currentStep;
  final question;
  final correctAnswer;
  final possibleAnswer1end;
  final possibleAnswer2;
  final possibleAnswer3;
  final possibleAnswer4;
  final possibleAnswer5;
  final questionNumber;
  final navigationPath;

  const QuizUIWidget({Key key, this.score, this.rightAnswer, this.currentStep, this.possibleAnswer5, this.possibleAnswer4, this.possibleAnswer3, this.possibleAnswer2, this.possibleAnswer1end, this.correctAnswer, this.question, this.questionNumber, this.navigationPath}) : super(key: key);

  @override
  _QuizUIWidgetState createState() =>
      _QuizUIWidgetState(score: this.score, rightAnswer: this.rightAnswer, currentStep: this.currentStep, possibleAnswer1end: this.possibleAnswer1end, possibleAnswer2: this.possibleAnswer2, possibleAnswer3: this.possibleAnswer3, possibleAnswer4: this.possibleAnswer4, possibleAnswer5: this.possibleAnswer5, question: this.question, questionNumber: this.questionNumber, navigationPath: this.navigationPath, correctAnswer: this.correctAnswer);
}

class _QuizUIWidgetState  extends State<QuizUIWidget> with ChangeNotifier {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String question;
  String correctAnswer;
  String possibleAnswer1;
  String possibleAnswer2;
  String possibleAnswer3;
  String possibleAnswer4;
  String possibleAnswer5;
  String possibleAnswer1end;
  String questionNumber;
  var navigationPath;
  int score;
  int currentStep;
  var rightAnswer;

  _QuizUIWidgetState({this.score, this.rightAnswer, this.currentStep, this.possibleAnswer5, this.possibleAnswer4, this.possibleAnswer3, this.possibleAnswer2, this.possibleAnswer1, this.correctAnswer, this.question, this.questionNumber, this.navigationPath, this.possibleAnswer1end});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: GetQuestionsCall.call(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/BackgroundBlue.png'),
                  fit: BoxFit.cover),
            ),
            child: Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
          );
        }
        final homepageGetQuestionsResponse = snapshot.data;

        question = possibleAnswer1 = getJsonField(
          (homepageGetQuestionsResponse?.jsonBody ?? ''),
          possibleAnswer1end,
        ).toString();;;

        correctAnswer = possibleAnswer1 = getJsonField(
          (homepageGetQuestionsResponse?.jsonBody ?? ''),
          possibleAnswer1end,
        ).toString();;;

        possibleAnswer1 = possibleAnswer1 = getJsonField(
          (homepageGetQuestionsResponse?.jsonBody ?? ''),
          possibleAnswer1end,
        ).toString();;

        possibleAnswer2 = possibleAnswer1 = getJsonField(
          (homepageGetQuestionsResponse?.jsonBody ?? ''),
          possibleAnswer1end,
        ).toString();;

        possibleAnswer3 = possibleAnswer1 = getJsonField(
          (homepageGetQuestionsResponse?.jsonBody ?? ''),
          possibleAnswer1end,
        ).toString();;

        possibleAnswer4 = possibleAnswer1 = getJsonField(
          (homepageGetQuestionsResponse?.jsonBody ?? ''),
          possibleAnswer1end,
        ).toString();;

        possibleAnswer5 = possibleAnswer1 = getJsonField(
          (homepageGetQuestionsResponse?.jsonBody ?? ''),
          possibleAnswer1end,
        ).toString();;

        return
          Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/BackgroundBlue.png'),
                    fit: BoxFit.cover),
              ),
              child: SafeArea(
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      child: Align(alignment: Alignment.topCenter,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ProgressBar(
                                currentStep: currentStep,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Question $questionNumber',
                                style: FlutterTheme.of(context).title1,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                question.toString(),
                                style: FlutterTheme.of(context).title2, textAlign: TextAlign.center,
                              ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,40,0,0),
                              child: GestureDetector(
                                onTap: navigationPath,
                                child: Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.white12,
                                    border: Border.all(
                                        color: Colors.white,
                                        width: 1.0),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0)),
                                    // boxShadow: [BoxShadow(blurRadius: 3,color: Colors.grey.shade500,offset: Offset(1,3))]
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(20,0,20,0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(question, style: FlutterTheme.of(context).title2,),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                              questionCard(
                                question: possibleAnswer2.toString(),
                                onTap: () {
                                  setState(() {
                                    notifyListeners();
                                    currentStep++;
                                    possibleAnswer2 == correctAnswer ? score++ : null;
                                    possibleAnswer2 == correctAnswer
                                        ? rightAnswer = true
                                        : rightAnswer = false;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => navigationPath(
                                            score: score,
                                            rightAnswer: rightAnswer,
                                            currentStep: currentStep,
                                          )),
                                    );
                                  });
                                },
                              ),
                              questionCard(
                                question: possibleAnswer3.toString(),
                                onTap: () {
                                  setState(() {
                                    notifyListeners();
                                    currentStep++;
                                    possibleAnswer3 == correctAnswer ? score++ : null;
                                    possibleAnswer3 == correctAnswer
                                        ? rightAnswer = true
                                        : rightAnswer = false;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => navigationPath(
                                            score: score,
                                            rightAnswer: rightAnswer,
                                            currentStep: currentStep,
                                          )),
                                    );
                                  });
                                },
                              ),
                              questionCard(
                                question: possibleAnswer4.toString(),
                                onTap: () {
                                  setState(() {
                                    notifyListeners();
                                    currentStep++;
                                    possibleAnswer4 == correctAnswer ? score++ : null;
                                    possibleAnswer4 == correctAnswer
                                        ? rightAnswer = true
                                        : rightAnswer = false;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => navigationPath(
                                            score: score,
                                            rightAnswer: rightAnswer,
                                            currentStep: currentStep,
                                          )),
                                    );
                                  });
                                },
                              ),
                              possibleAnswer5.toString().endsWith('null') ? SizedBox(height: 0,) :
                              questionCard(
                                question: possibleAnswer5.toString(),
                                onTap: () {
                                  setState(() {
                                    notifyListeners();
                                    currentStep++;
                                    possibleAnswer5 == correctAnswer ? score++ : null;
                                    possibleAnswer5 == correctAnswer
                                        ? rightAnswer = true
                                        : rightAnswer = false;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => navigationPath(
                                            score: score,
                                            rightAnswer: rightAnswer,
                                            currentStep: currentStep,
                                          )),
                                    );
                                  });
                                },
                              ),
                              SizedBox(height: 40),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Last Answer',
                                        style: FlutterTheme.of(context).title2,
                                      ),
                                      SizedBox(height: 10),
                                      CircleAvatar(
                                        backgroundColor: Colors.white24,
                                        radius: 30,
                                        child:
                                        rightAnswer == true ?
                                        Icon(
                                          Icons.thumb_up_alt_rounded,
                                          color: Colors.greenAccent,
                                          size: 30.0,
                                        ):
                                        Icon(
                                          Icons.thumb_down_alt_rounded,
                                          color: Colors.redAccent.shade400,
                                          size: 30.0,
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Total',
                                        style: FlutterTheme.of(context).title2,
                                      ),
                                      SizedBox(height: 10),
                                      CircleAvatar(
                                        backgroundColor: Colors.white24,
                                        radius: 30,
                                        child: (Text(
                                          score.toString(),
                                          style: FlutterTheme.of(context).title1,
                                        )),
                                      )
                                    ],
                                  ),
                                ],
                              ),


                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
      },
    );
  }
}
