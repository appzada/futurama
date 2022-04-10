import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:futurama/app_pages/about_page_widget.dart';
import 'package:futurama/app_pages/q1_page_widget.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../app_controls/flutter_theme.dart';
import 'package:futurama/app_controls/question_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    Key key,
  }) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  AnimationController _controller;
  Animation<Offset> _animation;

  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    )..forward();

    _animation = Tween<Offset>(
      begin: const Offset(1, 1),
      end: const Offset(0.05, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastLinearToSlowEaseIn,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);
    final isDarkTheme = currentTheme.brightness == Brightness.dark;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterTheme.of(context).tertiaryColor,
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
                        Image.asset('assets/images/FuturamaLogo.png'),



                        isDarkTheme == true ?
                        Text(
                          'Dark Mode Activated',
                          style: FlutterTheme.of(context).title1,
                        ) : Text(
                          'All Aboard',
                          style: FlutterTheme.of(context).title1,
                        ),

                        SizedBox(height: 40,),

                        SlideTransition(
                          textDirection: TextDirection.rtl,
                          position: _animation,
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: SizedBox(width: 200,
                              child: Image(
                                image: AssetImage('assets/images/PlanetExpress.png'),
                              ),
                            ),
                          ),
                        ),

                        questionCard(
                          question: 'About Futurama',
                          onTap: () {
                            setState(() {

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AboutPageWidget()),
                              );
                            });
                          },
                        ),
                        questionCard(
                          question: 'Quiz',
                          onTap: () {
                            setState(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Q1PageWidget()),
                              );
                            });
                          },
                        ),

                        SizedBox(height: 40),

                        Text(AppLocalizations.of(context).helloWorld, style: FlutterTheme.of(context).title2),

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
