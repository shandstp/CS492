import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(Wastegram());
}

class Wastegram extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WasteList(title: 'Flutter Demo Home Page'),
    );
  }
}

class WasteList extends StatelessWidget {
  const WasteList({Key key, this.title}) : super(key: key);

  final String title;

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return ListTile(
      title: Row(
        children: [
          Expanded(
            child: Text(
              DateFormat('EEEE, LLLL d, y')
                  .format(document['when'].toDate())
                  .toString(),
              // document['when'].toDate().toString(),
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ],
      ),
      trailing: Expanded(
        child: Text(document['quantity'].toString(),
            style: Theme.of(context).textTheme.headline6),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('waste').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const CircularProgressIndicator();
          return ListView.builder(
            itemExtent: 80.0,
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) =>
                _buildListItem(context, snapshot.data.documents[index]),
          );
        },
      ),
    );
  }
}
