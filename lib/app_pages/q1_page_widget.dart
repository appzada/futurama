import 'package:futurama/app_controls/progress_indicator.dart';
import 'package:futurama/app_controls/question_card.dart';
import 'package:futurama/app_pages/q2_page_widget.dart';
import '../backend/api_requests/api_calls.dart';
import '../app_controls/flutter_theme.dart';
import '../app_controls/flutter_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Q1PageWidget extends StatefulWidget {
  final int score;
  final rightAnswer;
  const Q1PageWidget({Key key, this.score, this.rightAnswer}) : super(key: key);

  @override
  _Q1PageWidgetState createState() =>
      _Q1PageWidgetState(score: this.score, rightAnswer: this.rightAnswer);
}

class _Q1PageWidgetState extends State<Q1PageWidget> with ChangeNotifier {
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

  _Q1PageWidgetState({this.score, this.rightAnswer, this.currentStep});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: GetQuestionsCall.call(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Align(alignment: Alignment.topCenter,
            child: Container(
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
            ),
          );
        }
        final homepageGetQuestionsResponse = snapshot.data;

        currentStep = 1;

        score = 0;

        rightAnswer = false;

        question = getJsonField(
          (homepageGetQuestionsResponse?.jsonBody ?? ''),
          r'''$[0].question''',
        ).toString();

        correctAnswer = getJsonField(
          (homepageGetQuestionsResponse?.jsonBody ?? ''),
          r'''$[0].correctAnswer''',
        ).toString();

        possibleAnswer1 = getJsonField(
          (homepageGetQuestionsResponse?.jsonBody ?? ''),
          r'''$[0].possibleAnswers[0]''',
        ).toString();

        possibleAnswer2 = getJsonField(
          (homepageGetQuestionsResponse?.jsonBody ?? ''),
          r'''$[0].possibleAnswers[1]''',
        ).toString();

        possibleAnswer3 = getJsonField(
          (homepageGetQuestionsResponse?.jsonBody ?? ''),
          r'''$[0].possibleAnswers[2]''',
        ).toString();

        possibleAnswer4 = getJsonField(
          (homepageGetQuestionsResponse?.jsonBody ?? ''),
          r'''$[0].possibleAnswers[3]''',
        ).toString();

        possibleAnswer5 = getJsonField(
          (homepageGetQuestionsResponse?.jsonBody ?? ''),
          r'''$[0].possibleAnswers[4]''',
        ).toString();

        possibleAnswer6 = getJsonField(
          (homepageGetQuestionsResponse?.jsonBody ?? ''),
          r'''$[0].possibleAnswers[5]''',
        ).toString();

        return Scaffold(
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
                              'Question 1',
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
                                        builder: (context) => Q2PageWidget(
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
                                        builder: (context) => Q2PageWidget(
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
                                        builder: (context) => Q2PageWidget(
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
                                        builder: (context) => Q2PageWidget(
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
                                        color: Colors.white12,
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
