import 'package:flutter/material.dart';
import 'package:journal/widgets/welcome.dart';
import 'package:sqflite/sqflite.dart';
import '../models/journal_entry.dart';
import '../models/journal.dart';
import '../widgets/journal_scaffold.dart';
import 'newEntry.dart';
import 'settings.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  static const routeName = '/';
  final String title = 'Home Screen';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  Journal journal;
  @override
  void initState() {
    super.initState();
    loadJournal();
  }

  void loadJournal() async {
    final Database database = await openDatabase(
      'journal.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE IF NOT EXISTS journal_entries(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, body TEXT, date DATETIME, rating INTEGER)');
      },
    );
    List<Map> journalRecords =
        await database.rawQuery('SELECT * FROM journal_entries');
    final journalEntries = journalRecords.map((record) {
      return JournalEntry(
          title: record['title'],
          body: record['body'],
          rating: record['rating'],
          dateTime: DateTime.parse(record['date']));
    }).toList();
    print('This is what journalEntries looks like: $journalEntries');
    setState(() {
      journal = Journal(entries: journalEntries);
    });
  }

  void _createEntry(BuildContext context) =>
      Navigator.of(context).pushNamed(NewEntry.routeName);

  void _changeSettings(BuildContext context) =>
      Navigator.of(context).pushNamed(Settings.routeName);

  @override
  Widget build(BuildContext context) {
    if (journal == null) {
      return JournalScaffold(
          title: 'Loading', child: Center(child: CircularProgressIndicator()));
    } else {
      return JournalScaffold(
          aib: addIconButton(context),
          title: journal.isEmpty() ? 'Welcome' : 'Journal Entries',
          child: journal.isEmpty() ? Welcome() : journalList(context),
          fab: addEntryFab(context));
    }
  }

  Widget journalList(BuildContext context) {
    return ListView.builder(
      itemCount: journal.numberOfEntries(),
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(journal.getEntry(index).title),
          subtitle: Text(journal.getEntry(index).dateTime.toString()),
        );
      },
    );
  }

  Widget addEntryFab(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _createEntry(context),
      tooltip: 'Add journal entry',
      child: Icon(Icons.add),
    );
  }

  Widget addIconButton(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.settings),
        tooltip: 'Change Settings',
        onPressed: () => _changeSettings(context));
  }
}
