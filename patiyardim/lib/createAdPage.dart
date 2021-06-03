import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'main.dart';
import 'dart:async';

class CreateAd extends StatefulWidget {
  @override
  _CreateAd createState() => new _CreateAd();
}

class _CreateAd extends State<CreateAd> {
  TextEditingController detailsController = TextEditingController();
  TextEditingController headerController = TextEditingController();

  String Details = '';
  String Header = '';
  File imageFile;

  _imgFromGallery(BuildContext context) async {
    var picture = File(await ImagePicker()
        .getImage(source: ImageSource.gallery)
        .then((pickedFile) => pickedFile.path));

    this.setState(() {
      imageFile = picture;
    });
  }

  _imgFromCamera(BuildContext context) async {
    var picture = File(await ImagePicker()
        .getImage(source: ImageSource.camera)
        .then((pickedFile) => pickedFile.path));

    this.setState(() {
      imageFile = picture;
    });
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
                child: Text("Seçim Yapın",
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xff212121),
                    ))),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Center(
                    child: GestureDetector(
                      child: Text(
                        "Galeri",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff212121),
                        ),
                      ),
                      onTap: () {
                        _imgFromGallery(
                            context); // yukarıda tanımlanan galeriyi açıp seçim yapmamızı sağlayan fonksiyon burada kullanılmıştır.
                      },
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  Center(
                    child: GestureDetector(
                      child: Text("Kamera",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff212121),
                          )),
                      onTap: () {
                        _imgFromCamera(
                            context); // aynı şekilde yukarıda tanımlanıp kamerayı açmamızı sağlayan fonksiyon burada çağırılmıştır.
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _decideImageView() {
    print(imageFile);
    if (imageFile == null) {
      return Text("Fotoğraf Seçilmedi. Lütfen Fotoğraf Seçin.",
          style: TextStyle(fontSize: 20, color: Color(0xff212121)));
    } else {
      return Container(
        decoration: BoxDecoration(
            color: Color(0xffBDBDBD),
            border: Border.all(color: Color(0xffB3E5FC))),
        child: Image.file(
          imageFile,
          width: 300,
          height: 300,
          fit: BoxFit.contain,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          leading: BackButton(
        onPressed: () => Navigator.pushReplacement(
            context, new MaterialPageRoute(builder: (context) => new MyApp())),
      )),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.fromLTRB(20, 15, 25, 20),
                    child: Text(
                      "Lütfen ilan bilgilerini ekleyin.",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange),
                    )),
                RaisedButton(
                  padding: EdgeInsets.fromLTRB(20, 15, 25, 15),
                  color: Colors.white,
                  elevation: 7.0,
                  splashColor: Color(0xff448AFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                    side: BorderSide(color: Color(0xff2196F3)),
                  ),
                  child: Icon(Icons.add_a_photo,
                      color: Colors.deepOrange, size: 45),
                  onPressed: () {
                    _showChoiceDialog(
                        context); //yukarıda tanıtılan fonksiyon burada çağırılmıştır.
                  },
                ),
                _decideImageView(),
                Container(
                    margin: EdgeInsets.all(20),
                    child: TextField(
                      controller: headerController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'İlan Başlığı',
                      ),
                      onChanged: (text) {
                        setState(() {
                          Header = text;
                        });
                      },
                    )),
                Container(
                    margin: EdgeInsets.all(20),
                    child: TextField(
                      controller: detailsController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'İlan Detayları',
                      ),
                      onChanged: (text) {
                        setState(() {
                          Details = text;
                        });
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
