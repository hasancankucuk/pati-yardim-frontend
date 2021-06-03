import 'package:flutter/material.dart';
import 'main.dart';

class SettingsPage extends StatefulWidget {
  final String title;

  SettingsPage({Key key, this.title}) : super(key: key);

  @override
  _SettingsPage createState() => new _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
          title: Text('Kullanıcı Adı Soyadı'),
          leading: BackButton(
            onPressed: () => Navigator.pushReplacement(context,
                new MaterialPageRoute(builder: (context) => new MyApp())),
          )),
      body: ListView(
        children: <Widget>[
          SettingSection('Üyeliğim', [
            SettingsPayload(
                'Üyelik Bilgilerim', 'Normal', Icons.arrow_forward_ios),
          ]),
          SettingSection('İlan Yönetimi', [
            SettingsPayload(
                'Yayında Olan İlanlarım', 'Normal', Icons.arrow_forward_ios),
            SettingsPayload('Yayından Kaldırılan İlanlarım', 'Normal'),
          ]),
          SettingSection('Mesajlar', [
            SettingsPayload(
                'İlan Mesajları', 'Normal', Icons.arrow_forward_ios),
            SettingsPayload(
                'Bilgilendirme Mesajları', 'Normal', Icons.arrow_forward_ios),
          ]),
          SettingSection('Diğer', [
            SettingsPayload(
                'Uygulama Ayarları', 'Normal', Icons.arrow_forward_ios),
            SettingsPayload(
                'Sorun / Şikayet Bildirimi', 'Normal', Icons.arrow_forward_ios),
            SettingsPayload('Hakkında', 'Normal', Icons.arrow_forward_ios),
          ]),
        ],
      ),
    );
  }
}

class SettingSection extends StatelessWidget {
  final String title;
  final List<SettingsPayload> payload;

  SettingSection(this.title, this.payload);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: 10.0, top: 7.0, bottom: 7.0),
              height: 35.0,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(223, 230, 233, 0.5),
                  border: Border(
                      bottom: BorderSide(
                          color: Color.fromRGBO(223, 230, 233, 0.5),
                          width: 1.0))),
              child: Row(children: <Widget>[
                Text(
                  this.title,
                  style: TextStyle(fontSize: 15.0, color: Colors.blueGrey),
                )
              ])),
          _buildListSettings(context),
        ],
      ),
    );
  }

  Widget _buildListSettings(BuildContext context) {
    List<Widget> items = List<Widget>();
    for (var setting in this.payload) {
      items.add(ListTile(
        title: Text(setting.title),
        trailing: Icon(setting.icon),
      ));
    }
    return Column(children: items);
  }
}

class SettingsPayload {
  final String title;
  final String type;
  final IconData icon;

  SettingsPayload(this.title, this.type, [this.icon]);
}
