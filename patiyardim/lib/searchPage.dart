import 'package:flutter/material.dart';
import 'main.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPage createState() => new _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  final String searchImage = 'assets/images/search.svg';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
          title: Text('Arama'),
          leading: BackButton(
            onPressed: () => Navigator.pushReplacement(context,
                new MaterialPageRoute(builder: (context) => new MyApp())),
          )),
      body: new Stack(
        children: <Widget>[
          new Padding(
              padding: new EdgeInsets.all(8.0),
              child: TextField(
                  decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  // TO DO: onPressed clear işlemi eklenecek.
                  onPressed: () {},
                  icon: Icon(Icons.clear),
                ),
                hintText: 'İlan Ara',
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0)),
              ))),
          new Center(
              child: SizedBox(
                  width: 300.0,
                  height: 400.0,
                  child: SvgPicture.asset(
                    searchImage,
                  )))
        ],
      ),
    );
  }
}
