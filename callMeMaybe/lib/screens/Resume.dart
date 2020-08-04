import 'package:flutter/material.dart';

class Resume extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 700.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 5.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.black,
                child: workHistory[index],
              );
            },
            childCount: workHistory.length,
          ),
        ),
      ],
    );
  }
}

class ResumeHeader extends StatelessWidget {
  final String name;
  final String email;
  final String github;

  ResumeHeader({Key key, this.name, this.email, this.github}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.0, 1.0, 1.0, 1.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: Text(name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)))
            ],
          ),
          Row(
            children: <Widget>[Expanded(child: Text(email))],
          ),
          Row(
            children: <Widget>[Expanded(child: Text(github))],
          ),
        ],
      ),
    );
  }
}

//Work History Individual Module class
class WHIM extends StatelessWidget {
  final String title, company, from, to, city, state, description;

  WHIM(
      {Key key,
      this.title,
      this.company,
      this.from,
      this.to,
      this.city,
      this.state,
      this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.0, 2.0, 2.0, 2.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: Text(title,
                      style: TextStyle(fontWeight: FontWeight.bold)))
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 7, 0, 7),
            child: Row(children: <Widget>[
              Expanded(child: Text(company)),
              Expanded(
                  child: Text(
                '$from - $to',
                textAlign: TextAlign.center,
              )),
              Expanded(
                  child: Text(
                '$city, $state',
                textAlign: TextAlign.end,
              )),
            ]),
          ),
          Row(
            children: <Widget>[Expanded(child: Text(description))],
          ),
        ],
      ),
    );
  }
}

final workHistory = <Widget>[
  ResumeHeader(
      name: 'Philip J. Fry',
      email: 'pjfry@planetexpress.net',
      github: 'github.com/whatsagithub'),
  WHIM(
      title: 'Delivery Boy',
      company: 'Planet Express',
      from: '6/2/3000',
      to: 'Present',
      city: 'New New York',
      state: 'NNY',
      description:
          'Took packages to where they were going. Also, I drank an emperor once.'),
  WHIM(
      title: 'Emperor of Trisol',
      company: 'Planet Trisol',
      from: '6/1/3000',
      to: '6/2/3000',
      city: 'Capital City',
      state: 'Trisol',
      description:
          'I got really thirsty and accidentally drank an emperor. Then I became the new emperor. Until I cried the old one out.'),
  WHIM(
      title: 'Delivery Boy',
      company: 'Planet Express',
      from: '1/1/3000',
      to: '6/1/3000',
      city: 'New New York',
      state: 'NNY',
      description:
          'Took packages to where they were going. Also, I got frozen once.'),
  WHIM(
      title: 'Human Popsicle',
      company: 'Applied Cryogenics',
      from: '1999',
      to: '3000',
      city: 'Manhattan',
      state: 'ONY',
      description: 'Mostly just chilled out with a beer.'),
  WHIM(
      title: 'Delivery Boy',
      company: 'Panucci\'s Pizza',
      from: '1995',
      to: '1999',
      city: 'Manhattan',
      state: 'ONY',
      description:
          'Delivered pizzas to where they were goin. Also, I had a dog named Seymour Asses'),
  WHIM(
      title: 'Iuno, Delivery Boy, Probably',
      company: 'Somewhere',
      from: 'The 90\'s',
      to: '1995',
      city: 'Manhattan',
      state: 'ONY',
      description:
          'I don\'t think the show mentions what he did before Panuzzi\'s Pizza'),
  WHIM(
      title: 'Iuno, Delivery Boy, Probably',
      company: 'Somewhere',
      from: 'The 90\'s',
      to: '1995',
      city: 'Manhattan',
      state: 'ONY',
      description:
          'I don\'t think the show mentions what he did before Panuzzi\'s Pizza'),
  WHIM(
      title: 'Iuno, Delivery Boy, Probably',
      company: 'Somewhere',
      from: 'The 90\'s',
      to: '1995',
      city: 'Manhattan',
      state: 'ONY',
      description:
          'I don\'t think the show mentions what he did before Panuzzi\'s Pizza'),
  WHIM(
      title: 'Iuno, Delivery Boy, Probably',
      company: 'Somewhere',
      from: 'The 90\'s',
      to: '1995',
      city: 'Manhattan',
      state: 'ONY',
      description:
          'I don\'t think the show mentions what he did before Panuzzi\'s Pizza'),
];
