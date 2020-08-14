import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:sqflite/sqflite.dart';

class JournalEntryFields {
  String title;
  String body;
  DateTime dateTime;
  int rating;
  String toString() {
    return 'Title: $title, Body: $body, Date: $dateTime, Rating: $rating';
  }
}

class NewEntry extends StatefulWidget {
  static const routeName = 'newEntry';
  @override
  _NewEntryState createState() => _NewEntryState();
}

class _NewEntryState extends State<NewEntry> {
  String rating = '4';
  final formKey = GlobalKey<FormState>();
  final journalEntryFields = JournalEntryFields();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Journal Entry'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    journalEntryFields.title = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a title';
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Body',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    journalEntryFields.body = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a body';
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Rating',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    journalEntryFields.rating = int.parse(value);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a rating';
                    } else if (int.parse(value) < 1 || int.parse(value) > 4) {
                      return 'Rating must be 1-4';
                    } else {
                      return null;
                    }
                  },
                ),
                // SizedBox(height: 10),
                // DropDownFormField(
                //   titleText: 'Rating',
                //   hintText: 'Please rate your experience',
                //   value: rating,
                //   onSaved: (value) {
                //     setState(() {
                //       rating = value;
                //     });
                //   },
                //   onChanged: (value) {
                //     setState(() {
                //       rating = value;
                //     });
                //   },
                //   dataSource: [
                //     {
                //       "display": "1 star",
                //       "value": "1",
                //     },
                //     {
                //       "display": "2 stars",
                //       "value": "2",
                //     },
                //     {
                //       "display": "3 stars",
                //       "value": "3",
                //     },
                //     {
                //       "display": "4 stars",
                //       "value": "4",
                //     }
                //   ],
                // ),
                RaisedButton(
                  onPressed: () async {
                    if (formKey.currentState.validate()) {
                      formKey.currentState.save();
                      // await deleteDatabase('journal.db');
                      final Database database =
                          await openDatabase('journal.db', version: 1,
                              onCreate: (Database db, int version) async {
                        await db.execute(
                            'CREATE TABLE IF NOT EXISTS journal_entries(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, body TEXT, date DATETIME, rating INTEGER)');
                      });
                      await database.transaction((txn) async {
                        await txn.rawInsert(
                          'INSERT INTO journal_entries(title, body, date, rating) VALUES (?, ?, ?, ?)',
                          [
                            journalEntryFields.title,
                            journalEntryFields.body,
                            DateTime.now().toString(),
                            4
                          ],
                        );
                      });
                      await database.close();
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text('Save Entry'),
                )
              ],
            )),
      ),
    );
  }
}
