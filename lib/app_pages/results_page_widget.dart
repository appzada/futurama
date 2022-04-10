import 'package:flutter/material.dart';
import 'package:futurama/app_pages/home_page_widget.dart';
import 'package:futurama/app_pages/q1_page_widget.dart';
import '../app_controls/flutter_theme.dart';
import 'package:futurama/app_controls/question_card.dart';

class ResultsPageWidget extends StatefulWidget {
  final int score;
  final rightAnswer;
  final currentStep;
  const ResultsPageWidget(
      {Key key, this.score, this.rightAnswer, this.currentStep})
      : super(key: key);

  @override
  _ResultsPageWidgetState createState() => _ResultsPageWidgetState(
      score: this.score,
      rightAnswer: this.rightAnswer,
      currentStep: this.currentStep);
}

class _ResultsPageWidgetState extends State<ResultsPageWidget> {
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

  _ResultsPageWidgetState({this.score, this.rightAnswer, this.currentStep});

  @override
  Widget build(BuildContext context) {
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
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        score >= 3?
                        Text(
                          'You Did Good, Kid!',
                          style: FlutterTheme.of(context).title1,
                        ):
                        Text(
                          'You Need Some Practice!',
                          style: FlutterTheme.of(context).title1,
                        ),
                        Text(
                          '$score out of 5',
                          style: FlutterTheme.of(context).title1,
                        ),
                        SizedBox(height: 40,),
                        score >= 3?
                        CircleAvatar(radius: 155, backgroundColor: Colors.white,child: Image.asset('assets/images/GoodResult.png',width: 300)):
                        CircleAvatar(radius: 155, backgroundColor: Colors.white,child: Image.asset('assets/images/BadResult.png',width: 300)),
                        SizedBox(height: 40,),
                        Text(
                          'Did you find this quiz stressful?\n\nDownload the Trive app today to improve your mental wellbeing.',
                          style: FlutterTheme.of(context).title2, textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20,),
                        /*Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 5.0,
                                color: Colors.white
                              ),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10.0)),
                              image: DecorationImage(
                                  image: AssetImage('assets/images/TriveIcon.png'),
                                  fit: BoxFit.cover),
                            color: Colors.white24
                          ),
                          ),*/

                        questionCard(
                          question: 'Restart',
                          onTap: () {
                            setState(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePageWidget(
                                    )),
                              );
                            });
                          },
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
  }
}
