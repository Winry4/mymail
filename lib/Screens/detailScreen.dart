import 'package:flutter/material.dart';
import 'package:mymail/model/email.dart';

class DetailScreen extends StatelessWidget {
  final Email email;

  const DetailScreen({
    Key key,
    @required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text('Functional programming'),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          textDirection: TextDirection.ltr,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Text(
                    'From: ' + email.from,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
                  width: 320,
                  height: 2,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  email.subject,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Text(
                    email.dateTime.toString().split(":")[0] +
                        ':' +
                        email.dateTime.toString().split(":")[1],
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
                  width: 320,
                  height: 2,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                  email.body,
                  textAlign: TextAlign.start,
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
