import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

class BusinessCard extends StatefulWidget {
  BusinessCard({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BusinessCardState createState() => _BusinessCardState();
}

class _BusinessCardState extends State<BusinessCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Spacer(flex: 3),
            SizedBox(
                child: Image.asset('assets/images/pngegg.png'),
                width: 100,
                height: 100),
            Spacer(flex: 1),
            Text(
              'Philip J. Fry',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Spacer(flex: 1),
            Text('Delivery Boy'),
            Spacer(flex: 1),
            GestureDetector(
              onTap: () => launch('tel:+1 917 867 5309'),
              child: Text(
                '917 867 5309',
              ),
            ),
            Spacer(flex: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => launch('https://github.com/shandstp'),
                  child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text('github.com/whatsagithub')),
                ),
                Padding(
                    padding: EdgeInsets.all(12.0),
                    child: GestureDetector(
                        onTap: () => launch(
                            'mailto:pjfry@planetexpress.net?subject=New Job&body=Shut up and take my money'),
                        child: Text('pjfry@planetexpress.net'))),
              ],
            ),
            Spacer(flex: 10)
          ],
        ),
      ),
    );
  }
}
