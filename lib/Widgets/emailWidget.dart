import 'package:flutter/material.dart';
import 'package:mymail/Screens/DetailScreen.dart';
import '../model/email.dart';

class EmailWidget extends StatelessWidget {
  final Email email;
  final Function deleteEmail;
  final Function markEmail;

  EmailWidget(
      {Key key,
      @required this.email,
      @required this.deleteEmail,
      @required this.markEmail})
      : super(key: key);

  Color getcolor() {
    if (email.read == true)
      return Colors.transparent;
    else
      return Colors.red;
  }

  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
          child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [circle(getcolor())],
            ),
          ),
          Container(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailScreen(email: email)),
                );
                markEmail(email.id);
              },
              onHorizontalDragEnd: (DragEndDetails details) {
                deleteEmail(email.id);
              },
              onLongPress: () {
                markEmail(email.id);
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.ltr,
                  children: [
                    Row(
                      children: [
                        Text(
                          email.dateTime.toString().split(" ")[0],
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          email.from,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          textAlign: TextAlign.start,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          email.subject,
                          style: TextStyle(fontSize: 14),
                          textAlign: TextAlign.start,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          width: 300,
                          height: 2,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }

  Widget circle(Color color) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
