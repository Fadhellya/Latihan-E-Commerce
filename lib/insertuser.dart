import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InsertData extends StatefulWidget {
  const InsertData({super.key});

  @override
  State<InsertData> createState() => _InsertDataState();
}

class _InsertDataState extends State<InsertData> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();

  Future<void> _insertDataUser() async {
    String url = "https://fadhellya.000webhostapp.com/adduser.php";

    try {
      var response = await http.post(Uri.parse(url), body: {
        "username": _username.text,
        "password": _password.text,
        "email": _email.text,
        "phone": _phone.text,
      });

      // Tambahkan penanganan respons dari server sesuai kebutuhan Anda

      // Setelah berhasil menambahkan data, kembali ke halaman sebelumnya (listuser.dart)
      Navigator.pop(context);
    } catch (exc) {
      print(exc);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add User",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
          child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
              child: Text(
                "Form Insert User",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
              child: TextField(
                controller: _username,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Username",
                    labelStyle: TextStyle(color: Colors.red),
                    hintText: "Masukkan Username",
                    prefixIcon: Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child: Icon(CupertinoIcons.person_2_alt,
                          color: Colors.orange),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
              child: TextField(
                controller: _password,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.red),
                    hintText: "Masukkan Password",
                    prefixIcon: Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child: Icon(CupertinoIcons.padlock_solid,
                          color: Colors.orange),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
              child: TextField(
                controller: _email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email Address",
                    labelStyle: TextStyle(color: Colors.red),
                    hintText: "Masukkan email",
                    prefixIcon: Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child:
                          Icon(CupertinoIcons.mail_solid, color: Colors.orange),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
              child: TextField(
                controller: _phone,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Phone",
                    labelStyle: TextStyle(color: Colors.red),
                    hintText: "Masukkan Nomor",
                    prefixIcon: Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child:
                          Icon(CupertinoIcons.phone_fill, color: Colors.orange),
                    )),
              ),
            ),
            ElevatedButton(
              onPressed: _insertDataUser,
              child: Text("ADD USER",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
          ],
        ),
      )),
    );
  }
}
