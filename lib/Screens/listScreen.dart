import 'package:flutter/material.dart';
import 'package:mymail/Widgets/emailWidget.dart';
import 'package:mymail/model/backend.dart';
import 'package:mymail/model/email.dart';
import '../model/backend.dart';

Backend _backend = new Backend();

class ListScreen extends StatefulWidget {
  const ListScreen({
    Key key,
  }) : super(key: key);

  _ListScreen createState() => _ListScreen();
}

class _ListScreen extends State<ListScreen> {
  List<Email> listaEmails = List<Email>();
  Color color;
  void deleteEmail(int id) {
    setState(() {
      _backend.deleteEmail(id);
      listaEmails = _backend.getEmails();
    });
  }

  void markEmail(int id) {
    setState(() {
      _backend.markEmailAsRead(id);
    });
  }

  @override
  void initState() {
    super.initState();
    listaEmails = _backend.getEmails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text('Mock mail'),
      ),
      body: ListView.builder(
        itemCount: listaEmails.length,
        itemBuilder: (context, index) {
          return EmailWidget(
            email: listaEmails.elementAt(index),
            deleteEmail: deleteEmail,
            markEmail: markEmail,
          );
        },
      ),
    );
  }
}
