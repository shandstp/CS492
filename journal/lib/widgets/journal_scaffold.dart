import 'package:flutter/material.dart';

class JournalScaffold extends StatelessWidget {
  final title;
  final child;
  final fab;
  final aib;

  JournalScaffold({this.title, this.child, this.fab, this.aib});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[aib],
      ),
      body: Container(child: child),
      floatingActionButton: fab,
    );
  }
}
