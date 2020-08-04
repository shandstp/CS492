import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  static const routeName = 'Settings';
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'),
      ),
      body: LabeledSwtich(
        label: 'Enable Dark Mode',
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        value: _isSelected,
        onChanged: (bool newValue) {
          setState(
            () {
              _isSelected = newValue;
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
