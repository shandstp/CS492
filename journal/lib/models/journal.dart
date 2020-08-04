import 'journal_entry.dart';

class Journal {
  List<JournalEntry> entries;
  Journal({this.entries});

  bool isEmpty() {
    if (entries == null) {
      return true;
    } else if (entries.length == 0) {
      return true;
    } else {
      return false;
    }
  }

  int numberOfEntries() {
    return entries.length;
  }

  JournalEntry getEntry(int index) {
    return entries[index];
  }
}
