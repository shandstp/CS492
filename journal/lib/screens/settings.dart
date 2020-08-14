import 'package:flutter/material.dart';
import 'package:journal/main.dart';

class Settings extends StatefulWidget {
  static const routeName = 'Settings';

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    JournalAppState appState = context.findAncestorStateOfType();
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'),
      ),
      body: LabeledSwtich(
        label: 'Enable Dark Mode',
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        value: appState.darkModeOn,
        onChanged: (bool newValue) {
          setState(
            () {
              appState.toggleDarkMode();
            },
          );
        },
      ),
    );
  }
}

class LabeledSwtich extends StatelessWidget {
  const LabeledSwtich({
    this.label,
    this.padding,
    this.groupValue,
    this.value,
    this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool groupValue;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Expanded(child: Text(label)),
            Switch(
              value: value,
              onChanged: (bool newValue) {
                onChanged(newValue);
              },
            ),
          ],
        ),
      ),
    );
  }
}
