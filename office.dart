import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Office extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  child: Container(
                    child: Text("My Office"),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text("My Operations"),
                  ),
                ),
              ],
            ),
          ),
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
                                child: Text('ITrack'),
                                height: 74.97,
                                minWidth: 144.92,
                                color: Color.fromRGBO(68, 153, 213, 1.0),
                                textColor: Colors.white,
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0)),
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
                                child: Text('TeamMate'),
                                height: 74.97,
                                minWidth: 144.92,
                                color: Color.fromRGBO(68, 153, 213, 1.0),
                                textColor: Colors.white,
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0)),
                                onPressed: () => {},
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
                                height: 74.97,
                                minWidth: 144.92,
                                color: Color.fromRGBO(68, 153, 213, 1.0),
                                textColor: Colors.white,
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0)),
                                onPressed: _launchURL1,
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
                                child: Text('Microsoft Stream'),
                                height: 74.97,
                                minWidth: 144.92,
                                color: Color.fromRGBO(68, 153, 213, 1.0),
                                textColor: Colors.white,
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0)),
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
                                child: Text('Kaizala'),
                                height: 74.97,
                                minWidth: 144.92,
                                color: Color.fromRGBO(68, 153, 213, 1.0),
                                textColor: Colors.white,
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0)),
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
                                child: Text('SharePoint'),
                                height: 74.97,
                                minWidth: 144.92,
                                color: Color.fromRGBO(68, 153, 213, 1.0),
                                textColor: Colors.white,
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0)),
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
        ));
  }
}

_launchURL() async {
  const url = 'https://kengenke.sharepoint.com/_layouts/15/sharepoint.aspx';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL1() async {
  const url = 'http://sap.kengen.co.ke/fapp';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL2() async {
  const url = 'https://itrack.kengen.co.ke';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL3() async {
  const url = 'https://webapp.kaiza.la/Account/Webapp';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL4() async {
  const url = 'https://web.microsoftstream.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
