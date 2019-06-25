import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPapers extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Scaffold(

      //App Bar
      appBar: new AppBar(
        title: new Text(
          'NewsPapers',
          style: new TextStyle(
            fontSize:
                Theme.of(context).platform == TargetPlatform.iOS ? 17.0 : 20.0,
          ),
        ),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),

      //Content of tabs
    body: Stack(
      children: <Widget>[
        Container(
          height: 900,
          width: 500,

          child: new Image.asset(
            'res/assets/img/ngong2.jpeg',
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: Container(
            height: 700,
            width: 427,
            decoration: BoxDecoration(
                color: Colors.white30,
                border: Border.all(color: Colors.white10, width: 0.5),
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: new GridView.count(
              primary: false,
              padding: const EdgeInsets.all(35.0),
              crossAxisSpacing: 50.0,
              crossAxisCount: 2,
              children: <Widget>[
                ButtonTheme.bar(

                  child: Align(
                    child: new Row(
                      children: <Widget>[
                        new MaterialButton(
                          child: Text('Nation Papers'),
                          height: 119.13,
                          minWidth: 144.64,
                          color: Color.fromRGBO(68, 153, 213, 1.0),
                          textColor: Colors.white,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          onPressed: _launchURL2,
                          splashColor: Colors.redAccent,

                        ),
                      ],
                    ),
                  ),
                ),
                ButtonTheme.bar(
                  child: Align(
                    child: new Row(
                      children: <Widget>[
                        new MaterialButton(
                          child: Text('Other Papers'),
                          height: 119.13,
                          minWidth: 144.64,
                          color: Color.fromRGBO(68, 153, 213, 1.0),
                          textColor: Colors.white,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          onPressed: _launchURL,
                          splashColor: Colors.redAccent,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],

    ),
  );
}
_launchURL2() async {
  const url = 'https://epaper.nationmedia.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
_launchURL() async {
  const url = 'https://extranet.kengen.co.ke/daily-newspapers-v2019';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}