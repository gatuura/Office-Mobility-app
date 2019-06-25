import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import './home.dart' as _firstTab;
import './trending.dart' as _secondTab;
import './profile.dart' as _thirdTab;
import './about.dart' as _aboutPage;
import './history.dart' as _historyPage;
import './SelfService.dart' as _SelfServicePage;
import './library.dart' as _libraryPage;
import './trending.dart' as _trendingPage;
import './newspapers.dart' as _newspapersPage;
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(new MaterialApp(
      title: 'KenGen',
      theme: new ThemeData(
          primarySwatch: Colors.purple,
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.purple,
          backgroundColor: Colors.deepPurpleAccent),


      home: new Tabs(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/about':
            return new FromRightToLeft(
              builder: (_) => new _aboutPage.About(),
              settings: settings,
            );
          case '/history':
            return new FromRightToLeft(
              builder: (_) => new _historyPage.History(),
              settings: settings,
            );
          case '/newspapers':
            return new FromRightToLeft(
              builder: (_) => new _newspapersPage.NewsPapers(),
              settings: settings,
            );
          case '/library':
            return new FromRightToLeft(
              builder: (_) => new _libraryPage.Library(),
              settings: settings,
            );
          case '/SelfService':
            return new FromRightToLeft(
              builder: (_) => new _SelfServicePage.SelfService(),
              settings: settings,
            );
          case '/trending':
            return new FromRightToLeft(
              builder: (_) => new _trendingPage.AllNews(),
              settings: settings,
            );
        }
      },
      // routes: <String, WidgetBuilder> {
      //   '/about': (BuildContext context) => new _aboutPage.About(),
      // }
    ));

class FromRightToLeft<T> extends MaterialPageRoute<T> {
  FromRightToLeft({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);


  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;

    return new SlideTransition(
      child: new Container(
        decoration: new BoxDecoration(boxShadow: [
          new BoxShadow(
            color: Colors.black26,
            blurRadius: 25.0,
          )
        ]),
        child: child,
      ),
      position: new Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(new CurvedAnimation(
        parent: animation,
        curve: Curves.fastOutSlowIn,
      )),
    );
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 400);
}

class Tabs extends StatefulWidget {
  @override
  TabsState createState() => new TabsState();
}

class TabsState extends State<Tabs> {
  PageController _tabController;

  var _title_app = null;
  int _tab = 0;

  @override
  void initState() {
    super.initState();
    _tabController = new PageController();
    this._title_app = TabItems[0].title;
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) => new Scaffold(

      //App Bar
      appBar: new AppBar(
          title: new Text(
            _title_app,
            style: new TextStyle(
              fontSize: Theme.of(context).platform == TargetPlatform.iOS
                  ? 25.0
                  : 32.0,
            ),
          ),
          elevation:
              Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
          centerTitle: true,
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.person_pin), onPressed: () {}),
          ]),

      //Content of tabs
      body: new PageView(
        controller: _tabController,
        onPageChanged: onTabChanged,
        children: <Widget>[
          new _firstTab.Home(),
          new _secondTab.AllNews(),
          new _thirdTab.Profile()
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Text('Mails'),

          onPressed: () {
            _launchURL();
          }),

      //Tabs
      bottomNavigationBar: Theme.of(context).platform == TargetPlatform.iOS
          ? new CupertinoTabBar(
              activeColor: Colors.purple,
              currentIndex: _tab,
              onTap: onTap,
              items: TabItems.map((TabItem) {
                return new BottomNavigationBarItem(
                  title: new Text(TabItem.title),
                  icon: new Icon(TabItem.icon),
                );
              }).toList(),
            )
          : new BottomNavigationBar(

              currentIndex: _tab,
              onTap: onTap,
              items: TabItems.map((TabItem) {
                return new BottomNavigationBarItem(
                  title: new Text(TabItem.title),
                  icon: new Icon(TabItem.icon),
                );
              }).toList(),
            ),

      //Drawer
      drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new Container(
                height: 120.0,
                color: Colors.white,
                child: new DrawerHeader(
                  padding: new EdgeInsets.all(0.0),
                  decoration: new BoxDecoration(
                  color: Colors.white,
                  ),
                  child: new Center(
                    child: new Image.asset(
                  'res/assets/img/Logo-Spread.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
            new ListTile(
              leading: new Icon(Icons.update),
              title: new Text('News'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed('/trending');
              }),
            new ListTile(
              leading: new Icon(Icons.calendar_today),
              title: new Text('NewsPapers'),
                onTap: () {
                  _launchURL4();
                }),
            new ListTile(
              leading: new Icon(Icons.library_books),
              title: new Text('Library'),
                onTap: () {
                  _launchURL3();
                }),
            new ListTile(
              leading: new Icon(Icons.highlight),
              title: new Text('Ignite'),
              onTap: () {
                _launchURL2();
              }),
            new ListTile(
              leading: new Icon(Icons.add_alert),
              title: new Text('SelfService'),
                onTap: () {
                  _launchURL5();
                }),
            new ListTile(
              leading: new Icon(Icons.language),
              title: new Text('History'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed('/history');
              }),
            new Divider(),
            new ListTile(
              leading: new Icon(Icons.exit_to_app),
              title: new Text('Sign Out'),
              onTap: () {
                Navigator.pop(context);
              }),
          ],
      )));

  void onTap(int tab) {
    _tabController.jumpToPage(tab);
  }

  void onTabChanged(int tab) {
    setState(() {
      this._tab = tab;
    });

    switch (tab) {
      case 0:
        this._title_app = TabItems[0].title;
        break;

      case 1:
        this._title_app = TabItems[1].title;
        break;

      case 2:
        this._title_app = TabItems[2].title;
        break;

      case 3:
        this._title_app = TabItems[3].title;
        break;

      case 4:
        this._title_app = TabItems[4].title;
        break;

      case 5:
        this._title_app = TabItems[5].title;
        break;
      case 6:
        this._title_app = TabItems[6].title;
        break;
    }
  }
}

class TabItem {
  const TabItem({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<TabItem> TabItems = const <TabItem>[
  const TabItem(title: 'Home', icon: Icons.home),
  const TabItem(title: 'News', icon: Icons.new_releases),
  const TabItem(title: 'Profile', icon: Icons.person)
];
_launchURL() async {
  const url = 'https://outlook.office.com/mail/inbox';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
_launchURL2() async {
  const url = 'https://innovation.kengen.co.ke';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
_launchURL3() async {
  const url = 'https://lrmg.skillport.com/skillportfe/main.action';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL4() async {
  const url = 'https://epapers.nationmedia.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
_launchURL5() async {
  const url = 'https://selfservice.kengen.co.ke';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
