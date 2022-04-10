import 'package:futurama/app_controls/progress_indicator.dart';
import 'package:futurama/app_controls/question_card.dart';
import 'package:futurama/app_pages/q3_page_widget.dart';
import '../backend/api_requests/api_calls.dart';
import '../app_controls/flutter_theme.dart';
import '../app_controls/flutter_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';



class Q2PageWidget extends StatefulWidget {
  final int score;
  final rightAnswer;
  final currentStep;
  const Q2PageWidget({Key key, this.score, this.rightAnswer, this.currentStep}) : super(key: key);

  @override
  _Q2PageWidgetState createState() =>
      _Q2PageWidgetState(score: this.score, rightAnswer: this.rightAnswer, currentStep: this.currentStep);
}

class _Q2PageWidgetState  extends State<Q2PageWidget> with ChangeNotifier {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String question;
  String correctAnswer;
  String possibleAnswer1;
  String possibleAnswer2;
  String possibleAnswer3;
  String possibleAnswer4;
  String possibleAnswer5;
  String possibleAnswer6;
  int score;
  int currentStep;
  var rightAnswer;

  _Q2PageWidgetState({this.score, this.rightAnswer, this.currentStep});

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

        question = getJsonField(
          (homepageGetQuestionsResponse?.jsonBody ?? ''),
          r'''$[1].question''',
        ).toString();

        correctAnswer = getJsonField(
          (homepageGetQuestionsResponse?.jsonBody ?? ''),
          r'''$[1].correctAnswer''',
        ).toString();

        possibleAnswer1 = getJsonField(
          (homepageGetQuestionsResponse?.jsonBody ?? ''),
          r'''$[1].possibleAnswers[0]''',
        ).toString();

        possibleAnswer2 = getJsonField(
          (homepageGetQuestionsResponse?.jsonBody ?? ''),
          r'''$[1].possibleAnswers[1]''',
        ).toString();

        possibleAnswer3 = getJsonField(
          (homepageGetQuestionsResponse?.jsonBody ?? ''),
          r'''$[1].possibleAnswers[2]''',
        ).toString();

        possibleAnswer4 = getJsonField(
          (homepageGetQuestionsResponse?.jsonBody ?? ''),
          r'''$[1].possibleAnswers[3]''',
        ).toString();

        possibleAnswer5 = getJsonField(
          (homepageGetQuestionsResponse?.jsonBody ?? ''),
          r'''$[1].possibleAnswers[4]''',
        ).toString();

        possibleAnswer6 = getJsonField(
          (homepageGetQuestionsResponse?.jsonBody ?? ''),
          r'''$[1].possibleAnswers[5]''',
        ).toString();

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
                              'Question 2',
                              style: FlutterTheme.of(context).title1,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              question.toString(),
                              style: FlutterTheme.of(context).title2, textAlign: TextAlign.center,
                            ),
                            questionCard(
                              question: possibleAnswer1.toString(),
                              onTap: () {
                                setState(() {
                                  notifyListeners();
                                  currentStep++;
                                  possibleAnswer1 == correctAnswer ? score++ : null;
                                  possibleAnswer1 == correctAnswer
                                      ? rightAnswer = true
                                      : rightAnswer = false;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Q3PageWidget(
                                          score: score,
                                          rightAnswer: rightAnswer,
                                          currentStep: currentStep,
                                        )),
                                  );
                                });
                              },
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
                                        builder: (context) => Q3PageWidget(
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
                                        builder: (context) => Q3PageWidget(
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
                                        builder: (context) => Q3PageWidget(
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
                                        builder: (context) => Q3PageWidget(
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
