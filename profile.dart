import 'package:flutter/material.dart';
class CommonThings{
  static Size size;
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CommonThings.size = MediaQuery.of(context).size;
    return MaterialApp(
      title: 'Profile',
      debugShowCheckedModeBanner: false,
      home: MyProfilePage(),
    );
  }
}

var color1 = Color(0xFFa572c0);
var color2 = Color(0xFF6559d4);
var profileImage = NetworkImage(
    'https://static1.squarespace.com/static/55f45174e4b0fb5d95b07f39/t/5aec4511aa4a991e53e6c044/1525433627644/Alexandra+Agoston+archives.jpg?format=1000w');

class MyProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CommonThings.size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
          children: <Widget>[
          SizedBox(
          height: 8.0,
         ),
          UpperSection(),
         SizedBox(
          height: 32.0,
         ),
            MiddleSection(),

      ],
    ));
  }
}

class UpperSection extends StatelessWidget {
  const UpperSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 32.0,
        ),
        Padding(
          padding: EdgeInsets.all(32.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    Icons.settings,
                    color: color1,
                  ),
                ],
              ),
              SizedBox(
                height: 8.0,
              ),
              CircleAvatar(
                backgroundImage: profileImage,
                radius: 80,
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
              Text(
                'KGN 702**00',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 32.0),
          child: Container(
            height: 4.0,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [color1, color2])),
          ),
        ),
        SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.only(left: 32.0, right: 48.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[


              Column(
                children: <Widget>[
                  Text(
                    '2',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  Text(
                    'Unread',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    'Mail',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}


class MiddleSection extends StatelessWidget {
  const MiddleSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: <Widget>[
          Divider(height: 8.0,),
          ListTile(
            title: Text("Today's activity"),
            subtitle: Text('Posts'),
            trailing: ClipOval(
              child: Container(
                  height: 40.0,
                  width: 40.0,
                  color: Colors.green.withOpacity(0.2),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add),
                    color: Colors.green,
                  )),
            ),
          ),
          SizedBox(height: 8.0,),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Container(
              height: 160.0,
              child: ListView(
                padding: EdgeInsets.all(0.0),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  ItemCard(Icons.add_a_photo, 'Posts', '2 new'),
                  ItemCard(Icons.tab, 'Office posts', '3 new'),
                  ItemCard(Icons.pan_tool, 'Pending', '4 tasks'),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final icon;
  final name;
  final tasks;
  const ItemCard(

      this.icon,
      this.name,
      this.tasks
      );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        height: 160.0,
        width: 120.0,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [color1, color2])),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(icon, color: Colors.white,),
              Spacer(),
              Text(name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              SizedBox(height: 4.0,),
              Text(tasks, style: TextStyle(color: Colors.white.withOpacity(0.6)),),
            ],
          ),
        ),
      ),
    );
  }
}