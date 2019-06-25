import 'package:flutter/material.dart';

import 'package:prototype1/newspapers.dart';
import './office.dart';
import 'package:url_launcher/url_launcher.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(

      backgroundColor: Colors.white30,
      body: Stack(
        children: <Widget>[
          Container(
            height: 900,
            width: 700,
            child: new Image.asset(
              'res/assets/img/ngong.jpeg',
              fit: BoxFit.cover,
            ),
          ),
           Center(
             child: Container(
              height: 575,
              width: 427,
              decoration: BoxDecoration(
              color: Colors.white30,

                  border: Border.all(color: Colors.white10, width: 0.5),
                  borderRadius: BorderRadius.all(Radius.circular(65))),
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
                            child: Text('Power Bot'),
                            height: 119.13,
                            minWidth: 134.64,
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
                            child: Text('WorkFlowGen'),
                            height: 119.13,
                            minWidth: 134.64,
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
                  ButtonTheme.bar(
                    child: Align(
                      child: new Row(
                        children: <Widget>[
                          new MaterialButton(
                            child: Text('My Office'),
                            height: 119.13,
                            minWidth: 134.64,
                            color: Color.fromRGBO(68, 153, 213, 1.0),
                            textColor: Colors.white,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => Office(),
                                )),
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
                            child: Text('Self Service'),
                            height: 119.13,
                            minWidth: 134.64,
                            color: Color.fromRGBO(68, 153, 213, 1.0),
                            textColor: Colors.white,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            onPressed: _launchURL4,
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
                            child: Text('SAP Fiori'),
                            height: 150.57,
                            minWidth: 140.92,
                            color: Color.fromRGBO(68, 153, 213, 1.0),
                            textColor: Colors.white,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            onPressed: _launchURL3,
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
                            child: Text('News Papers'),
                            height: 150.57,
                            minWidth: 140.92,
                            color: Color.fromRGBO(68, 153, 213, 1.0),
                            textColor: Colors.white,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => NewsPapers(),
                                )),
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
}
_launchURL() async {
  const url = 'https://wfgen.kengen.co.ke/wfgen/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
_launchURL2() async {
  const url = 'https://www.kengen.co.ke';
  if (await canLaunch(url)) {
    await launch(url,forceWebView: true);
  } else {
    throw 'Could not launch $url';
  }
}
_launchURL3() async {
  const url = 'https://sap.kengen.co.ke/fapp';
  if (await canLaunch(url)) {
    await launch(url,forceWebView: true);
  } else {
    throw 'Could not launch $url';
  }
}
_launchURL4() async {
  const url = 'https://selfservice.kengen.co.ke';
  if (await canLaunch(url)) {
    await launch(url,forceWebView: true);
  } else {
    throw 'Could not launch $url';
  }
}


