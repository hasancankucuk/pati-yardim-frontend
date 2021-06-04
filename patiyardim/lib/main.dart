import 'dart:io';

import 'package:flutter/material.dart';
import 'package:patiyardim/notificationsPage.dart';
import 'settingsPage.dart';
import 'createAdPage.dart';
import 'searchPage.dart';
import 'notificationsPage.dart';
import 'signPage.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      // home: MyHomePage(title: 'Pati Yardım'),
      home: Home(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _randomImage = "https://picsum.photos/200/300";
  String _randomPetImage = "https://placedog.net/640/480?random";
  String dummyAd =
      "Bu bir test ilanıdır.Bu bir test ilanıdır.Bu bir test ilanıdır. ";
  bool isHeaderClose = false;
  double lastOffset = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: _listView,
        floatingActionButton: Container(
          height: 65.0,
          width: 65.0,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () => Navigator.pushReplacement(context,
                  new MaterialPageRoute(builder: (context) => new CreateAd())),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              // elevation: 5.0,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            child: Container(
              height: 75,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    iconSize: 30.0,
                    padding: EdgeInsets.only(left: 28.0),
                    icon: Icon(Icons.home),
                    onPressed: () {},
                  ),
                  IconButton(
                    iconSize: 30.0,
                    padding: EdgeInsets.only(right: 28.0),
                    icon: Icon(Icons.search),
                    onPressed: () => Navigator.pushReplacement(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new SearchPage())),
                  ),
                  IconButton(
                    iconSize: 30.0,
                    padding: EdgeInsets.only(left: 28.0),
                    icon: Icon(Icons.notifications),
                    onPressed: () => Navigator.pushReplacement(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new NotificationsPage())),
                  ),
                  IconButton(
                    iconSize: 30.0,
                    padding: EdgeInsets.only(right: 28.0),
                    icon: Icon(Icons.person_sharp),
                    onPressed: () => Navigator.pushReplacement(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new SettingsPage())),
                  )
                ],
              ),
            ))
            );
  }

  Widget get _listView => ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return _listViewCard;
        },
      );

  Widget get _listViewCard => Card(
        child: ListTile(
          leading: CircleAvatar(backgroundImage: NetworkImage(_randomImage)),
          title: Wrap(
            direction: Axis.horizontal,
            runSpacing: 5,
            children: <Widget>[
              _listCardTitle("İlan"),
              Text(dummyAd),
              _adImagesField,
            ],
          ),
        ),
      );

  Widget _listCardTitle(String text) => Text(
        text,
        style: titleTextStyle,
      );

  Widget get _adImagesField => Container(
        height: 300,
        width: 300,
        decoration: new BoxDecoration(
            image: new DecorationImage(image: NetworkImage(_randomPetImage))),
      );
}

final titleTextStyle = TextStyle(
    letterSpacing: 1,
    fontSize: 20,
    fontWeight: FontWeight.w800,
    color: Colors.black);
