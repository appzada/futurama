import 'package:futurama/app_controls/question_card.dart';
import 'package:futurama/app_pages/home_page_widget.dart';

import '../backend/api_requests/api_calls.dart';
import '../app_controls/flutter_theme.dart';
import '../app_controls/flutter_util.dart';
import 'package:flutter/material.dart';


class AboutPageWidget extends StatefulWidget {
  const AboutPageWidget({Key key}) : super(key: key);

  @override
  _AboutPageWidgetState createState() => _AboutPageWidgetState();
}

class _AboutPageWidgetState extends State<AboutPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: GetInfoCall.call(),
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
        final homePageGetInfoResponse = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterTheme.of(context).tertiaryColor,
            elevation: 0,
            shadowColor: FlutterTheme.of(context).tertiaryColor,
          ),
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
                  padding: const EdgeInsets.all(20),
                  child: Align(alignment: Alignment.topCenter,
                    child: SingleChildScrollView(
                      child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                  child: Text(
                                    'Show Synopsis',
                                    style: FlutterTheme.of(context).title1,
                                  ),
                                ),
                                Text(
                                  getJsonField(
                                    (homePageGetInfoResponse?.jsonBody ?? ''),
                                    r'''$[0].synopsis''',
                                  ).toString(),
                                  style: FlutterTheme.of(context).title2,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                                  child: Text(
                                    'Years Aired',
                                    style: FlutterTheme.of(context).title1,
                                  ),
                                ),
                                Text(
                                  getJsonField(
                                    (homePageGetInfoResponse?.jsonBody ?? ''),
                                    r'''$[0].yearsAired''',
                                  ).toString(),
                                  style: FlutterTheme.of(context).title2,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                                  child: Text(
                                    'Creators',
                                    style: FlutterTheme.of(context).title1,
                                  ),
                                ),
                                Text(
                                  getJsonField(
                                    (homePageGetInfoResponse?.jsonBody ?? ''),
                                    r'''$[0].creators[0].name''',
                                  ).toString(),
                                  style: FlutterTheme.of(context).title2,
                                ),
                                Text(
                                  getJsonField(
                                    (homePageGetInfoResponse?.jsonBody ?? ''),
                                    r'''$[0].creators[0].url''',
                                  ).toString(),
                                  style: FlutterTheme.of(context).title2,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                  child: Text(
                                    getJsonField(
                                      (homePageGetInfoResponse?.jsonBody ?? ''),
                                      r'''$[0].creators[1].name''',
                                    ).toString(),
                                    style: FlutterTheme.of(context).title2,
                                  ),
                                ),
                                Text(
                                  getJsonField(
                                    (homePageGetInfoResponse?.jsonBody ?? ''),
                                    r'''$[0].creators[1].url''',
                                  ).toString(),
                                  style: FlutterTheme.of(context).title2,
                                ),

                                questionCard(
                                  question: 'Home',
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
                )
                  ),
                ),
              ));
      },
    );
  }
}
