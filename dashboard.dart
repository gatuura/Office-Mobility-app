import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Container(
    child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Icon(
              Icons.trending_up,
              size: 150.0,
              color: Colors.lightGreenAccent
          ),
          new Text('Top news tab content')
        ]
    ),
  );
}

