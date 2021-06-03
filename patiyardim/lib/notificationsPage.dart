import 'package:flutter/material.dart';
import 'main.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationsPage extends StatefulWidget {
  final String title;
  NotificationsPage({Key key, this.title}) : super(key: key);

  @override
  _NotificationsPage createState() => new _NotificationsPage();
}

class _NotificationsPage extends State<NotificationsPage> {
  final String notificationsImage = 'assets/images/notification.svg';
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
            title: Text('Bildirimler'),
            leading: BackButton(
              onPressed: () => Navigator.pushReplacement(context,
                  new MaterialPageRoute(builder: (context) => new MyApp())),
            )
          ),
          body: Center(
            child: SizedBox(
                  width: 300.0,
                  height: 400.0,
                  child: SvgPicture.asset(
                    notificationsImage,
                  ))
          ) ,
        );
  }
}
