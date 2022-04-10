import 'package:flutter/material.dart';
import 'package:futurama/app_controls/flutter_theme.dart';

class questionCard extends StatelessWidget {

  var onTap;
  var color;
  String question;

  questionCard({this.onTap, this.question, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,40,0,0),
      child: GestureDetector(
        onTap: onTap,
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
    );
  }
}
